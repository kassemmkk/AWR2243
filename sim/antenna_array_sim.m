% OpenEMS Antenna Array Simulation
% 2x2 Patch Antenna Array at 2.4 GHz
% Run this script in MATLAB/Octave with openEMS installed

clear
close all
clc

% Add openEMS paths
addpath('/files/tools/openEMS/matlab');
addpath('/files/tools/CSXCAD/matlab');

% Initialize openEMS
FDTD = InitFDTD();
FDTD = SetGaussExcite(FDTD, 2.4e9, 0.5e9);
FDTD = SetBoundaryCond(FDTD, {'MUR', 'MUR', 'MUR', 'MUR', 'MUR', 'MUR'});

% Initialize CSXCAD geometry
CSX = InitCSX();

% Physical constants
c0 = 299792458;  % Speed of light
unit = 1e-3;     % All dimensions in mm

% Simulation parameters
f0 = 2.4e9;      % Center frequency
fc = 0.5e9;      % Gaussian pulse bandwidth
lambda0 = c0/f0; % Wavelength in free space

% Substrate properties (FR4)
substrate.epsR = 4.3;
substrate.height = 1.6;
substrate.tanD = 0.025;

% Patch antenna dimensions (calculated for 2.4 GHz)
patch.width = 30;    % Width of patch (mm)
patch.length = 28;   % Length of patch (mm)
feed.offset = 6;     % Feed point offset from center
feed.width = 3;      % Width of feed line

% Array configuration
array.spacing = 62.5;  % Lambda/2 spacing at 2.4 GHz (mm)
array.nx = 2;          % Number of elements in x
array.ny = 2;          % Number of elements in y

% Ground plane dimensions
gnd.width = array.spacing * (array.nx + 1);
gnd.length = array.spacing * (array.ny + 1);

% Simulation box dimensions
simbox.x = gnd.width + 60;
simbox.y = gnd.length + 60;
simbox.z = 40;

% Materials
CSX = AddMaterial(CSX, 'substrate');
CSX = SetMaterialProperty(CSX, 'substrate', 'Epsilon', substrate.epsR);
CSX = SetMaterialProperty(CSX, 'substrate', 'Kappa', substrate.tanD*2*pi*f0*8.854e-12*substrate.epsR);

CSX = AddMetal(CSX, 'copper');

% Create substrate
start = [-gnd.width/2, -gnd.length/2, 0];
stop = [gnd.width/2, gnd.length/2, substrate.height];
CSX = AddBox(CSX, 'substrate', 1, start, stop);

% Create ground plane
start = [-gnd.width/2, -gnd.length/2, 0];
stop = [gnd.width/2, gnd.length/2, 0];
CSX = AddBox(CSX, 'copper', 10, start, stop);

% Create array elements and ports
port_num = 1;
for i = 1:array.nx
    for j = 1:array.ny
        % Calculate position of each element
        x_pos = (i - (array.nx+1)/2) * array.spacing;
        y_pos = (j - (array.ny+1)/2) * array.spacing;
        
        % Create patch
        start = [x_pos - patch.width/2, y_pos - patch.length/2, substrate.height];
        stop = [x_pos + patch.width/2, y_pos + patch.length/2, substrate.height];
        CSX = AddBox(CSX, 'copper', 10, start, stop);
        
        % Create feed line
        start = [x_pos - feed.width/2, y_pos - patch.length/2, 0];
        stop = [x_pos + feed.width/2, y_pos - patch.length/2 + feed.offset, substrate.height];
        CSX = AddBox(CSX, 'copper', 10, start, stop);
        
        % Create lumped port
        start = [x_pos - feed.width/2, y_pos - patch.length/2, 0];
        stop = [x_pos + feed.width/2, y_pos - patch.length/2, substrate.height];
        [CSX, port{port_num}] = AddLumpedPort(CSX, 20, port_num, 50, start, stop, [0 0 1], true);
        port_num = port_num + 1;
    end
end

% Mesh setup
mesh_res = c0/(f0+fc)/unit/20; % Lambda/20 resolution

% Initialize mesh structure
mesh = [];
mesh.x = [];
mesh.y = [];
mesh.z = [];

% Create mesh lines - simulation box
mesh.x = [-simbox.x/2, simbox.x/2];
mesh.y = [-simbox.y/2, simbox.y/2];
mesh.z = [-simbox.z/2, 0, substrate.height, simbox.z/2];

% Add mesh lines for ground plane
mesh.x = [mesh.x, -gnd.width/2, gnd.width/2];
mesh.y = [mesh.y, -gnd.length/2, gnd.length/2];

% Add mesh lines for patches and feeds
for i = 1:array.nx
    x_pos = (i - (array.nx+1)/2) * array.spacing;
    mesh.x = [mesh.x, x_pos - patch.width/2, x_pos + patch.width/2];
    mesh.x = [mesh.x, x_pos - feed.width/2, x_pos + feed.width/2];
end

for j = 1:array.ny
    y_pos = (j - (array.ny+1)/2) * array.spacing;
    mesh.y = [mesh.y, y_pos - patch.length/2, y_pos + patch.length/2];
    mesh.y = [mesh.y, y_pos - patch.length/2 + feed.offset];
end

% Sort and unique mesh lines
mesh.x = sort(unique(mesh.x));
mesh.y = sort(unique(mesh.y));
mesh.z = sort(unique(mesh.z));

% Apply mesh
CSX = DefineRectGrid(CSX, unit, mesh);

% Alternative mesh smoothing approach
% Try to smooth individual directions
mesh = CSX.RectilinearGrid;
try
    mesh = SmoothMeshLines(mesh, 'x', mesh_res, 1.3);
    mesh = SmoothMeshLines(mesh, 'y', mesh_res, 1.3);
    mesh = SmoothMeshLines(mesh, 'z', mesh_res, 1.3);
    CSX = DefineRectGrid(CSX, unit, mesh);
catch
    % If SmoothMeshLines fails, just use the unsmoothed mesh
    disp('Warning: Mesh smoothing failed, using unsmoothed mesh');
end

% Add near-field to far-field (NF2FF) box
% Get the mesh lines from CSX structure
mesh_lines = CSX.RectilinearGrid.FDTD.Lines;
x_lines = mesh_lines.x;
y_lines = mesh_lines.y;
z_lines = mesh_lines.z;

% Define NF2FF box with some margin from boundaries
if length(x_lines) > 20 && length(y_lines) > 20 && length(z_lines) > 5
    start = [x_lines(10), y_lines(10), z_lines(3)];
    stop = [x_lines(end-9), y_lines(end-9), z_lines(end-1)];
else
    % Fallback for smaller meshes
    start = [x_lines(5), y_lines(5), z_lines(2)];
    stop = [x_lines(end-4), y_lines(end-4), z_lines(end-1)];
end

[CSX, nf2ff] = CreateNF2FFBox(CSX, 'nf2ff', start, stop);

% Prepare simulation directory
Sim_Path = 'antenna_array_2x2';
Sim_CSX = 'antenna_array.xml';

[status, message, messageid] = rmdir(Sim_Path, 's'); % Clear previous results
[status, message, messageid] = mkdir(Sim_Path);

% Write CSX file
WriteOpenEMS([Sim_Path '/' Sim_CSX], FDTD, CSX);

% View geometry (optional - comment out for batch runs)
% CSXGeomPlot([Sim_Path '/' Sim_CSX]);

% Run openEMS
RunOpenEMS(Sim_Path, Sim_CSX);

%% Post-processing
disp('Post-processing...');

% Frequency range
freq = linspace(1.5e9, 3.5e9, 201);

% Calculate port parameters
for n = 1:length(port)
    port{n} = calcPort(port{n}, Sim_Path, freq);
end

% S-parameter calculation
s_params = zeros(length(port), length(port), length(freq));
for i = 1:length(port)
    for j = 1:length(port)
        s_params(i,j,:) = squeeze(port{j}.uf.ref)./(squeeze(port{i}.uf.inc));
    end
end

% Plot S11 for all ports
figure;
hold on;
for i = 1:length(port)
    s11_db = 20*log10(abs(squeeze(s_params(i,i,:))));
    plot(freq/1e9, s11_db, 'LineWidth', 2, 'DisplayName', sprintf('S%d%d', i, i));
end
grid on;
xlabel('Frequency (GHz)');
ylabel('S11 (dB)');
title('Return Loss of 2x2 Patch Antenna Array');
legend('Location', 'best');
ylim([-40, 0]);

% Plot coupling between adjacent elements
figure;
s21_db = 20*log10(abs(squeeze(s_params(2,1,:))));
s31_db = 20*log10(abs(squeeze(s_params(3,1,:))));
plot(freq/1e9, s21_db, 'LineWidth', 2, 'DisplayName', 'S21');
hold on;
plot(freq/1e9, s31_db, 'LineWidth', 2, 'DisplayName', 'S31');
grid on;
xlabel('Frequency (GHz)');
ylabel('Coupling (dB)');
title('Mutual Coupling in Array');
legend('Location', 'best');
ylim([-40, 0]);

%% Radiation pattern calculation
disp('Calculating radiation pattern...');

% Define angles
theta = 0:2:180;
phi = 0:2:360;

% Calculate at center frequency
nf2ff = CalcNF2FF(nf2ff, Sim_Path, f0, theta, phi);

% Get directivity
directivity_dBi = nf2ff.Dmax;
fprintf('Maximum Directivity: %.1f dBi\n', directivity_dBi);

% E-field components
E_theta = nf2ff.E_theta;
E_phi = nf2ff.E_phi;

% Calculate total power pattern
P_total = abs(E_theta).^2 + abs(E_phi).^2;
P_total_dB = 10*log10(P_total);

% Plot 3D radiation pattern
figure;
[THETA, PHI] = meshgrid(theta*pi/180, phi*pi/180);
X = abs(P_total)' .* sin(THETA) .* cos(PHI);
Y = abs(P_total)' .* sin(THETA) .* sin(PHI);
Z = abs(P_total)' .* cos(THETA);
surf(X, Y, Z, P_total_dB');
shading interp;
colormap jet;
colorbar;
axis equal;
title('3D Radiation Pattern');
xlabel('X');
ylabel('Y');
zlabel('Z');

% Plot 2D cuts
figure;
subplot(1,2,1);
% E-plane (phi = 0)
phi_idx = 1;
plot(theta, P_total_dB(phi_idx,:), 'LineWidth', 2);
grid on;
xlabel('Theta (degrees)');
ylabel('Directivity (dBi)');
title('E-plane Pattern (φ = 0°)');
ylim([-30, 20]);

subplot(1,2,2);
% H-plane (theta = 90)
theta_idx = find(theta == 90);
polarplot(phi*pi/180, P_total_dB(:,theta_idx), 'LineWidth', 2);
title('H-plane Pattern (θ = 90°)');

%% Array factor visualization
figure;
% Calculate array factor for uniform excitation
AF = zeros(size(theta));
k = 2*pi*f0/c0;
d = array.spacing * unit;

for t = 1:length(theta)
    AF_sum = 0;
    for m = 1:array.nx
        for n = 1:array.ny
            % Position of element
            xmn = (m - (array.nx+1)/2) * d;
            ymn = (n - (array.ny+1)/2) * d;
            % Phase from position
            phase = k * xmn * sin(theta(t)*pi/180) * cos(0*pi/180);
            AF_sum = AF_sum + exp(1j*phase);
        end
    end
    AF(t) = abs(AF_sum);
end

AF_dB = 20*log10(AF/max(AF));
plot(theta, AF_dB, 'LineWidth', 2);
grid on;
xlabel('Theta (degrees)');
ylabel('Array Factor (dB)');
title('Array Factor - Uniform Excitation');
ylim([-30, 10]);

%% Save results
save([Sim_Path '/array_results.mat'], 'freq', 's_params', 'theta', 'phi', 'P_total_dB', 'directivity_dBi');

%% Display summary
fprintf('\n========== Simulation Summary ==========\n');
fprintf('Array Configuration: %dx%d\n', array.nx, array.ny);
fprintf('Center Frequency: %.1f GHz\n', f0/1e9);
fprintf('Element Spacing: %.1f mm (%.2f λ)\n', array.spacing, array.spacing*unit/(c0/f0));
fprintf('Maximum Directivity: %.1f dBi\n', directivity_dBi);

% Find return loss at center frequency
[~, f_idx] = min(abs(freq - f0));
for i = 1:length(port)
    s11_f0 = 20*log10(abs(s_params(i,i,f_idx)));
    fprintf('S%d%d at %.1f GHz: %.1f dB\n', i, i, f0/1e9, s11_f0);
end

fprintf('========================================\n');

%% Beam steering example
fprintf('\nBeam Steering Example:\n');
fprintf('To steer the beam, apply progressive phase shifts:\n');
fprintf('For 30° steering in θ direction:\n');
steering_angle = 30; % degrees
phase_shift = k * d * sin(steering_angle*pi/180);
fprintf('Phase shift between elements: %.1f degrees\n', phase_shift*180/pi);

% Calculate steered pattern
AF_steered = zeros(size(theta));
for t = 1:length(theta)
    AF_sum = 0;
    for m = 1:array.nx
        for n = 1:array.ny
            xmn = (m - (array.nx+1)/2) * d;
            ymn = (n - (array.ny+1)/2) * d;
            % Spatial phase
            spatial_phase = k * xmn * sin(theta(t)*pi/180) * cos(0*pi/180);
            % Applied phase for steering
            applied_phase = -k * xmn * sin(steering_angle*pi/180) * cos(0*pi/180);
            AF_sum = AF_sum + exp(1j*(spatial_phase + applied_phase));
        end
    end
    AF_steered(t) = abs(AF_sum);
end

figure;
AF_steered_dB = 20*log10(AF_steered/max(AF_steered));
plot(theta, AF_dB, 'b-', 'LineWidth', 2, 'DisplayName', 'Broadside');
hold on;
plot(theta, AF_steered_dB, 'r--', 'LineWidth', 2, 'DisplayName', sprintf('Steered %d°', steering_angle));
grid on;
xlabel('Theta (degrees)');
ylabel('Array Factor (dB)');
title('Beam Steering Demonstration');
legend('Location', 'best');
ylim([-30, 10]);
