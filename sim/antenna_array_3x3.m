% Simple 3x3 Patch Antenna Array Simulation
clear; close all; clc;

% Add paths
addpath('/files/tools/openEMS/matlab');
addpath('/files/tools/CSXCAD/matlab');

% Constants
c0 = 299792458;
f0 = 2.4e9;
unit = 1e-3;

% Initialize
FDTD = InitFDTD();
FDTD = SetGaussExcite(FDTD, f0, 0.5e9);
FDTD = SetBoundaryCond(FDTD, {'MUR', 'MUR', 'MUR', 'MUR', 'MUR', 'MUR'});
CSX = InitCSX();

% Substrate
CSX = AddMaterial(CSX, 'FR4');
CSX = SetMaterialProperty(CSX, 'FR4', 'Epsilon', 4.3);
CSX = AddMetal(CSX, 'copper');

% Dimensions
patch_w = 38;
patch_l = 30;
substrate_h = 1.6;
spacing = 62.5;  % 0.5 lambda

% Create 3x3 array
for i = 1:3
    for j = 1:3
        x = (i-2) * spacing;
        y = (j-2) * spacing;
        
        % Patch
        CSX = AddBox(CSX, 'copper', 10, ...
            [x-patch_w/2, y-patch_l/2, substrate_h], ...
            [x+patch_w/2, y+patch_l/2, substrate_h]);
        
        % Feed (simplified - only excite center element)
        if i==2 && j==2
            [CSX, port] = AddLumpedPort(CSX, 20, 1, 50, ...
                [x-1.5, y-patch_l/2, 0], ...
                [x+1.5, y-patch_l/2, substrate_h], [0 0 1], true);
        end
    end
end

% Substrate and ground
CSX = AddBox(CSX, 'FR4', 1, [-100, -100, 0], [100, 100, substrate_h]);
CSX = AddBox(CSX, 'copper', 10, [-100, -100, 0], [100, 100, 0]);

% Mesh
mesh.x = sort([-100, -spacing:spacing:spacing, 100]);
mesh.y = mesh.x;
mesh.z = [0, substrate_h, 20];
CSX = DefineRectGrid(CSX, unit, mesh);

% Run
Sim_Path = '3x3_array';
mkdir(Sim_Path);
WriteOpenEMS([Sim_Path '/array.xml'], FDTD, CSX);
RunOpenEMS(Sim_Path, 'array.xml');

%% Simple Visualization
freq = linspace(2e9, 3e9, 101);
port = calcPort(port, Sim_Path, freq);

% S11 plot
figure;
s11 = port.uf.ref ./ port.uf.inc;
plot(freq/1e9, 20*log10(abs(s11)), 'LineWidth', 2);
grid on; xlabel('Frequency (GHz)'); ylabel('S11 (dB)');
title('3x3 Array - Center Element S11');

% Find resonance
[min_val, idx] = min(abs(s11));
fprintf('Resonance at %.3f GHz, S11 = %.1f dB\n', ...
    freq(idx)/1e9, 20*log10(min_val));
