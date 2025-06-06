
% Add paths
addpath('/files/tools/openEMS/matlab');
addpath('/files/tools/CSXCAD/matlab');

close all;
clear;
physical_constants;

%% === Simulation Parameters ===
f0 = 77e9;             % center frequency [Hz]
fc = 10e9;             % frequency span [Hz]
lambda = c0 / f0;
unit = 1e-6;           % µm units
patch_size = lambda/2;
substrate_thickness = 0.254e-3;  % 10 mil
array_size = [4, 4];   % 4x4 array

%% === Create Simulation ===
CSX = InitCSX();
CSX = AddMetal(CSX, 'PEC');
CSX = AddMaterial(CSX, 'RO3003');
CSX = SetMaterialProperty(CSX, 'RO3003', 'Epsilon', 3.0);

%% === Define the Simulation Mesh ===
dx = lambda / 20;
mesh.x = SmoothMeshLines( ...
    [-patch_size, 0, patch_size * array_size(1), -3*dx, 3*dx], 1.4, dx);
mesh.y = SmoothMeshLines( ...
    [-patch_size, 0, patch_size * array_size(2), -3*dx, 3*dx], 1.4, dx);
mesh.z = SmoothMeshLines([0, substrate_thickness, lambda/10], 1.5, substrate_thickness/5);

%% === Define Substrate ===
CSX = AddBox(CSX, 'RO3003', 0, ...
    [-Inf -Inf 0], [Inf Inf substrate_thickness]);

%% === Create Patch Elements ===
for ix = 0:array_size(1)-1
    for iy = 0:array_size(2)-1
        px = ix * patch_size;
        py = iy * patch_size;
        patch_name = ['patch_', num2str(ix), '_', num2str(iy)];
        CSX = AddBox(CSX, 'PEC', 1, ...
            [px - patch_size/2, py - patch_size/2, substrate_thickness], ...
            [px + patch_size/2, py + patch_size/2, substrate_thickness]);
    end
end

%% === Add Excitation Port (simplified plate feed) ===
CSX = AddExcitation(CSX, 'port1', 1, [0 0 -1], [0 0 1]);
CSX = AddBox(CSX, 'PEC', 10, ...
    [-0.1 -0.1 -1]*lambda, [0.1 0.1 0]);

%% === Set Boundary Conditions ===
BC = {'PML_8','PML_8','PML_8','PML_8','PML_8','PML_8'};
SimBox = [max(mesh.x), max(mesh.y), max(mesh.z)];
FDTD = InitFDTD();
FDTD = SetGaussExcite(FDTD, f0, fc);
FDTD = SetBoundaryCond(FDTD, BC);

%% === Far-field monitor ===
CSX = AddDump(CSX, 'Et');
CSX = AddBox(CSX, 'Et', 0, ...
    [-Inf -Inf max(mesh.z)], [Inf Inf max(mesh.z)]);

CSX = AddDump(CSX, 'Farfield');
CSX = AddBox(CSX, 'Farfield', 0, ...
    [-patch_size, -patch_size, max(mesh.z)], ...
    [patch_size * array_size(1), patch_size * array_size(2), max(mesh.z)]);

%% === Write and Run Simulation ===
Sim_Path = 'tmp_antenna_array';
Sim_CSX = 'antenna_array_77ghz.xml';
[~, ~, ~] = rmdir(Sim_Path, 's');
[~, ~, ~] = mkdir(Sim_Path);
WriteOpenEMS([Sim_Path '/' Sim_CSX], FDTD, CSX, unit);
RunOpenEMS(Sim_Path, Sim_CSX);

%% === Post-Processing ===
plotSettings = [];
plotSettings.freq = f0;
figure;
PlotReflectionCoefficient(Sim_Path, 1, plotSettings);
