% 2x2 Array with all ports excited
clear; close all; clc;

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

% Materials
CSX = AddMaterial(CSX, 'FR4');
CSX = SetMaterialProperty(CSX, 'FR4', 'Epsilon', 4.3);
CSX = AddMetal(CSX, 'copper');

% Dimensions
patch_w = 38;
patch_l = 30;
substrate_h = 1.6;
spacing = 62.5;

% Create 2x2 array with all ports
port_num = 1;
for i = 1:2
    for j = 1:2
        x = (i-1.5) * spacing;
        y = (j-1.5) * spacing;
        
        % Patch
        CSX = AddBox(CSX, 'copper', 10, ...
            [x-patch_w/2, y-patch_l/2, substrate_h], ...
            [x+patch_w/2, y+patch_l/2, substrate_h]);
        
        % Port for each element
        [CSX, port{port_num}] = AddLumpedPort(CSX, 20, port_num, 50, ...
            [x-1.5, y-patch_l/2, 0], ...
            [x+1.5, y-patch_l/2, substrate_h], [0 0 1], true);
        port_num = port_num + 1;
    end
end

% Substrate and ground
CSX = AddBox(CSX, 'FR4', 1, [-80, -80, 0], [80, 80, substrate_h]);
CSX = AddBox(CSX, 'copper', 10, [-80, -80, 0], [80, 80, 0]);

% Mesh
mesh.x = [-80, -spacing/2, spacing/2, 80];
mesh.y = mesh.x;
mesh.z = [0, substrate_h, 20];
CSX = DefineRectGrid(CSX, unit, mesh);

% Run
Sim_Path = '2x2_all_ports';
mkdir(Sim_Path);
WriteOpenEMS([Sim_Path '/array.xml'], FDTD, CSX);
RunOpenEMS(Sim_Path, 'array.xml');

%% Visualization
freq = linspace(2e9, 3e9, 101);

% Calculate all ports
for n = 1:4
    port{n} = calcPort(port{n}, Sim_Path, freq);
end

% Plot S-parameters
figure;
for n = 1:4
    s11 = port{n}.uf.ref ./ port{n}.uf.inc;
    plot(freq/1e9, 20*log10(abs(s11)), 'LineWidth', 2, ...
         'DisplayName', sprintf('S%d%d', n, n));
    hold on;
end
grid on; xlabel('Frequency (GHz)'); ylabel('Return Loss (dB)');
title('2x2 Array - All Ports S11');
legend('Location', 'southeast');
ylim([-30 0]);

% Coupling between adjacent elements
figure;
s21 = port{2}.uf.ref ./ port{1}.uf.inc;
s31 = port{3}.uf.ref ./ port{1}.uf.inc;
plot(freq/1e9, 20*log10(abs(s21)), 'r-', 'LineWidth', 2, 'DisplayName', 'S21');
hold on;
plot(freq/1e9, 20*log10(abs(s31)), 'b-', 'LineWidth', 2, 'DisplayName', 'S31');
grid on; xlabel('Frequency (GHz)'); ylabel('Coupling (dB)');
title('Mutual Coupling');
legend();
ylim([-40 0]);

