% Fast 2x2 Patch Array - Optimized for quick simulation
clear; close all; clc;

% Add paths
addpath('/files/tools/openEMS/matlab');
addpath('/files/tools/CSXCAD/matlab');

% Constants
c0 = 299792458;
f0 = 2.4e9;
unit = 1e-3;

% Initialize with reduced timesteps for faster simulation
FDTD = InitFDTD(20000, 1e-3);  % max timesteps, end criteria
FDTD = SetGaussExcite(FDTD, f0, 0.3e9);  % Narrower bandwidth = faster convergence
FDTD = SetBoundaryCond(FDTD, {'MUR', 'MUR', 'MUR', 'MUR', 'MUR', 'MUR'});

% Initialize
CSX = InitCSX();

% Materials
CSX = AddMaterial(CSX, 'FR4');
CSX = SetMaterialProperty(CSX, 'FR4', 'Epsilon', 4.3);
CSX = AddMetal(CSX, 'copper');

% Dimensions
patch_w = 38;
patch_l = 30;
substrate_h = 1.6;
spacing = 62.5;

% Create 2x2 array - only 1 port for speed
for i = 1:2
    for j = 1:2
        x = (i-1.5) * spacing;
        y = (j-1.5) * spacing;
        
        % Patch
        CSX = AddBox(CSX, 'copper', 10, ...
            [x-patch_w/2, y-patch_l/2, substrate_h], ...
            [x+patch_w/2, y+patch_l/2, substrate_h]);
        
        % Single port on element (1,1)
        if i==1 && j==1
            [CSX, port] = AddLumpedPort(CSX, 20, 1, 50, ...
                [x-1.5, y-patch_l/2, 0], ...
                [x+1.5, y-patch_l/2, substrate_h], [0 0 1], true);
        end
    end
end

% Smaller domain for faster simulation
box_size = 70;
CSX = AddBox(CSX, 'FR4', 1, [-box_size, -box_size, 0], [box_size, box_size, substrate_h]);
CSX = AddBox(CSX, 'copper', 10, [-box_size, -box_size, 0], [box_size, box_size, 0]);

% Coarse mesh for speed
mesh_res = c0/f0/unit/12;  % Lambda/12 instead of Lambda/20
mesh.x = [-box_size : mesh_res : box_size];
mesh.y = mesh.x;
mesh.z = [0, substrate_h, 15];  % Smaller air box
CSX = DefineRectGrid(CSX, unit, mesh);

% Run
Sim_Path = 'fast_2x2';
mkdir(Sim_Path);
WriteOpenEMS([Sim_Path '/array.xml'], FDTD, CSX);

tic;  % Start timer
RunOpenEMS(Sim_Path, 'array.xml');
sim_time = toc;
fprintf('Simulation time: %.1f seconds\n', sim_time);

%% Quick results
freq = linspace(2.2e9, 2.6e9, 51);  % Fewer frequency points
port = calcPort(port, Sim_Path, freq);

% S11 plot
figure;
s11 = port.uf.ref ./ port.uf.inc;
plot(freq/1e9, 20*log10(abs(s11)), 'b-', 'LineWidth', 2);
grid on; xlabel('Frequency (GHz)'); ylabel('S11 (dB)');
title('Fast 2x2 Array - S11');
ylim([-25 0]);

% Find resonance
[min_val, idx] = min(abs(s11));
fprintf('Resonance: %.3f GHz, S11 = %.1f dB\n', freq(idx)/1e9, 20*log10(min_val));
