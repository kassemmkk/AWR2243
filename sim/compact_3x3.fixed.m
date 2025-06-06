% Realistic 3x3 Patch Antenna Array with Full S-Parameter Extraction
% Optimized dimensions for 2.4 GHz WiFi/ISM band

clear; close all; clc;

% Add paths
addpath('/files/tools/openEMS/matlab');
addpath('/files/tools/CSXCAD/matlab');

%% PART 1: ANTENNA DESIGN CALCULATIONS
fprintf('=== Realistic 3x3 Patch Array Design ===\n');
fprintf('Target: 2.4 GHz (WiFi/ISM Band)\n\n');

% Physical constants
c0 = 299792458;  % m/s
f0 = 2.4e9;      % Hz
lambda0 = c0/f0 * 1000;  % mm

% Substrate: FR-4 (realistic parameters)
substrate.er = 4.4;        % Relative permittivity
substrate.tand = 0.02;     % Loss tangent
substrate.h = 1.524;       % Height in mm (standard 60 mil)
substrate.thickness = 0.035; % Copper thickness (1 oz)

% Calculate effective permittivity
W_initial = c0/(2*f0) * sqrt(2/(substrate.er+1)) * 1000;  % Initial width estimate
er_eff = (substrate.er + 1)/2 + (substrate.er - 1)/2 * ...
         (1 + 12*substrate.h/W_initial)^(-0.5);

fprintf('Substrate Properties:\n');
fprintf('  Material: FR-4\n');
fprintf('  Permittivity: %.1f\n', substrate.er);
fprintf('  Height: %.3f mm\n', substrate.h);
fprintf('  Effective permittivity: %.2f\n', er_eff);

% Patch dimensions (optimized for 2.4 GHz)
% Length calculation with end effect
L_eff = c0/(2*f0*sqrt(er_eff)) * 1000;  % Effective length
dL = 0.412 * substrate.h * ((er_eff + 0.3)*(W_initial/substrate.h + 0.264)) / ...
     ((er_eff - 0.258)*(W_initial/substrate.h + 0.8));
patch.L = L_eff - 2*dL;  % Physical length

% Width for good radiation efficiency
patch.W = c0/(2*f0) * sqrt(2/(substrate.er+1)) * 1000;

% Fine-tune dimensions based on empirical data
patch.L = 29.8;  % mm (tuned for FR-4 at 2.4 GHz)
patch.W = 38.2;  % mm

% Inset feed design for 50 ohm match
Rin_edge = 90 * (patch.L/patch.W)^2;  % Edge resistance
feed.inset = patch.L/2 * sqrt(50/Rin_edge);  % Inset depth
feed.width = 2.9;  % Standard 50 ohm line width on FR-4
feed.gap = 0.5;   % Gap on each side of inset

fprintf('\nPatch Dimensions:\n');
fprintf('  Width: %.1f mm\n', patch.W);
fprintf('  Length: %.1f mm\n', patch.L);
fprintf('  Feed inset: %.1f mm\n', feed.inset);
fprintf('  Feed width: %.1f mm\n', feed.width);

% Array parameters
array.spacing = 0.5 * lambda0;  % Half wavelength spacing
array.nx = 3;
array.ny = 3;
array.size = array.spacing * 2.5;  % Total array size

fprintf('\nArray Configuration:\n');
fprintf('  Elements: %dx%d = %d\n', array.nx, array.ny, array.nx*array.ny);
fprintf('  Spacing: %.1f mm (%.2f λ)\n', array.spacing, array.spacing/lambda0);
fprintf('  Total size: %.1f x %.1f mm\n', array.size, array.size);

%% PART 2: BUILD GEOMETRY
fprintf('\n=== Building Geometry ===\n');

% Initialize FDTD
FDTD = InitFDTD('NrTS', 40000, 'EndCriteria', 1e-4);
FDTD = SetGaussExcite(FDTD, f0, f0/4);
FDTD = SetBoundaryCond(FDTD, {'MUR', 'MUR', 'MUR', 'MUR', 'MUR', 'MUR'});

% Initialize CSX
CSX = InitCSX();
unit = 1e-3;  % All dimensions in mm

% Define materials
CSX = AddMaterial(CSX, 'FR4');
CSX = SetMaterialProperty(CSX, 'FR4', 'Epsilon', substrate.er);
CSX = SetMaterialProperty(CSX, 'FR4', 'Kappa', substrate.tand*2*pi*f0*8.854e-12*substrate.er);

CSX = AddMetal(CSX, 'copper');

% Ground plane and substrate
gnd_size = array.size + 20;  % 20mm margin
CSX = AddBox(CSX, 'copper', 10, [-gnd_size/2, -gnd_size/2, 0], [gnd_size/2, gnd_size/2, 0]);
CSX = AddBox(CSX, 'FR4', 1, [-gnd_size/2, -gnd_size/2, 0], [gnd_size/2, gnd_size/2, substrate.h]);

% Create all 9 patches with individual ports
fprintf('Creating 9 patches with individual ports...\n');
port_num = 1;
port = {};

for i = 1:array.nx
    for j = 1:array.ny
        % Element position
        x_pos = (i - (array.nx+1)/2) * array.spacing;
        y_pos = (j - (array.ny+1)/2) * array.spacing;
        
        % Create patch
        start_patch = [x_pos - patch.W/2, y_pos - patch.L/2, substrate.h];
        stop_patch = [x_pos + patch.W/2, y_pos + patch.L/2, substrate.h];
        CSX = AddBox(CSX, 'copper', 10, start_patch, stop_patch);
        
        % Create inset feed
        % Main feed line
        start_feed = [x_pos - feed.width/2, y_pos - patch.L/2 - 5, substrate.h];
        stop_feed = [x_pos + feed.width/2, y_pos - patch.L/2, substrate.h];
        CSX = AddBox(CSX, 'copper', 10, start_feed, stop_feed);
        
        % Inset into patch
        start_inset = [x_pos - feed.width/2, y_pos - patch.L/2, substrate.h];
        stop_inset = [x_pos + feed.width/2, y_pos - patch.L/2 + feed.inset, substrate.h];
        CSX = AddBox(CSX, 'copper', 10, start_inset, stop_inset);
        
        % Create port at feed point
        start_port = [x_pos - feed.width/2, y_pos - patch.L/2 - 5, 0];
        stop_port = [x_pos + feed.width/2, y_pos - patch.L/2 - 5, substrate.h];
        [CSX, port{port_num}] = AddLumpedPort(CSX, 20, port_num, 50, start_port, stop_port, [0 0 1], true);
        
        fprintf('  Element (%d,%d): Port %d at (%.1f, %.1f)\n', i, j, port_num, x_pos, y_pos);
        port_num = port_num + 1;
    end
end

% Setup mesh
fprintf('\nSetting up mesh...\n');
mesh = [];

% X mesh
mesh.x = [-gnd_size/2-10, -gnd_size/2];
for i = 1:array.nx
    x = (i - (array.nx+1)/2) * array.spacing;
    mesh.x = [mesh.x, x-patch.W/2-1, x-patch.W/2, x-feed.width/2, x+feed.width/2, x+patch.W/2, x+patch.W/2+1];
end
mesh.x = [mesh.x, gnd_size/2, gnd_size/2+10];

% Y mesh  
mesh.y = [-gnd_size/2-10, -gnd_size/2];
for j = 1:array.ny
    y = (j - (array.ny+1)/2) * array.spacing;
    mesh.y = [mesh.y, y-patch.L/2-6, y-patch.L/2-1, y-patch.L/2, y-patch.L/2+feed.inset, y+patch.L/2, y+patch.L/2+1];
end
mesh.y = [mesh.y, gnd_size/2, gnd_size/2+10];

% Z mesh
mesh.z = [0, substrate.h, substrate.h+1, 5, 15];

% Clean up mesh
mesh.x = sort(unique(mesh.x));
mesh.y = sort(unique(mesh.y));
mesh.z = sort(unique(mesh.z));

% Define grid
CSX = DefineRectGrid(CSX, unit, mesh);

% Prepare simulation
Sim_Path = 'realistic_3x3_array';
Sim_CSX = 'antenna.xml';
[status, message] = mkdir(Sim_Path);

% Write CSX file
WriteOpenEMS([Sim_Path '/' Sim_CSX], FDTD, CSX);

% Run simulation
fprintf('\n=== Running Simulation ===\n');
fprintf('This will take approximately 5-10 minutes...\n');
tic;
RunOpenEMS(Sim_Path, Sim_CSX);
sim_time = toc;
fprintf('Simulation completed in %.1f seconds\n', sim_time);

%% PART 3: S-PARAMETER EXTRACTION
fprintf('\n=== Extracting S-Parameters ===\n');

% Frequency range
freq = linspace(2.2e9, 2.6e9, 201);
num_ports = 9;

% Calculate port parameters
fprintf('Calculating port parameters...\n');
for n = 1:num_ports
    port{n} = calcPort(port{n}, Sim_Path, freq);
end

% Extract full S-parameter matrix
fprintf('Building S-parameter matrix...\n');
S = zeros(num_ports, num_ports, length(freq));

for i = 1:num_ports
    for j = 1:num_ports
        S(i,j,:) = squeeze(port{j}.uf.ref) ./ squeeze(port{i}.uf.inc);
    end
end

%% PART 4: VISUALIZATION AND RESULTS
fprintf('\n=== Generating Results ===\n');

% Create main results figure
figure('Position', [50 50 1400 900], 'Name', 'Realistic 3x3 Array - Complete Results');

% 1. All S11 parameters
subplot(3,3,1);
hold on;
colors = lines(9);
for n = 1:num_ports
    s11 = squeeze(S(n,n,:));
    plot(freq/1e9, 20*log10(abs(s11)), 'LineWidth', 1.5, 'Color', colors(n,:));
end
grid on;
xlabel('Frequency (GHz)');
ylabel('|S_{ii}| (dB)');
title('Return Loss - All Ports');
ylim([-30 0]);
plot([2.2 2.6], [-10 -10], 'k--', 'LineWidth', 1);

% 2. Coupling matrix at 2.4 GHz
subplot(3,3,2);
[~, f0_idx] = min(abs(freq - 2.4e9));
S_2p4 = abs(S(:,:,f0_idx));
S_2p4_dB = 20*log10(S_2p4);
imagesc(S_2p4_dB);
colorbar;
caxis([-40 0]);
xlabel('Port j');
ylabel('Port i');
title('|S_{ij}| at 2.4 GHz (dB)');
colormap(jet);

% 3. Array layout with port numbers
subplot(3,3,3);
port_num = 1;
for i = 1:array.nx
    for j = 1:array.ny
        x = (i - (array.nx+1)/2) * array.spacing;
        y = (j - (array.ny+1)/2) * array.spacing;
        rectangle('Position', [x-patch.W/2, y-patch.L/2, patch.W, patch.L], ...
                  'FaceColor', colors(port_num,:), 'EdgeColor', 'k');
        hold on;
        text(x, y, num2str(port_num), 'HorizontalAlignment', 'center', ...
             'FontSize', 12, 'FontWeight', 'bold');
        port_num = port_num + 1;
    end
end
axis equal;
xlabel('X (mm)'); ylabel('Y (mm)');
title('Port Numbering');
grid on;

% 4. Mutual coupling plots
subplot(3,3,4);
hold on;
% Plot coupling to center element (port 5)
for n = [1 2 3 4 6 7 8 9]
    s_n5 = squeeze(S(n,5,:));
    plot(freq/1e9, 20*log10(abs(s_n5)), 'LineWidth', 1.5);
end
grid on;
xlabel('Frequency (GHz)');
ylabel('|S_{i5}| (dB)');
title('Coupling to Center Element (Port 5)');
legend('S_{15}', 'S_{25}', 'S_{35}', 'S_{45}', 'S_{65}', 'S_{75}', 'S_{85}', 'S_{95}', ...
       'Location', 'southwest');
ylim([-50 -10]);

% 5. Smith chart - center element
subplot(3,3,5);
s11_center = squeeze(S(5,5,:));
theta = linspace(0, 2*pi, 100);
plot(cos(theta), sin(theta), 'k-'); hold on;
plot([-1 1], [0 0], 'k-'); plot([0 0], [-1 1], 'k-');
plot(real(s11_center), imag(s11_center), 'b-', 'LineWidth', 2);
plot(real(s11_center(f0_idx)), imag(s11_center(f0_idx)), 'ro', 'MarkerSize', 10);
axis equal; xlim([-1.2 1.2]); ylim([-1.2 1.2]);
title('Smith Chart - Center Element');
grid on;

% 6. Input impedance - center element
subplot(3,3,6);
Z5 = port{5}.uf.tot ./ port{5}.if.tot;
plot(freq/1e9, real(Z5), 'b-', freq/1e9, imag(Z5), 'r-', 'LineWidth', 2);
hold on;
plot([2.2 2.6], [50 50], 'k--');
plot([2.2 2.6], [0 0], 'k--');
xlabel('Frequency (GHz)');
ylabel('Impedance (Ω)');
title('Input Impedance - Center Element');
legend('Real', 'Imag', 'Location', 'best');
grid on;

% 7. VSWR for all ports
subplot(3,3,7);
hold on;
for n = 1:num_ports
    s11 = squeeze(S(n,n,:));
    vswr = (1 + abs(s11)) ./ (1 - abs(s11));
    plot(freq/1e9, vswr, 'LineWidth', 1.5);
end
grid on;
xlabel('Frequency (GHz)');
ylabel('VSWR');
title('VSWR - All Ports');
ylim([1 5]);
plot([2.2 2.6], [2 2], 'k--', 'LineWidth', 1);

% 8. Performance summary table
subplot(3,3,8);
% Calculate key metrics at 2.4 GHz
metrics = [];
for n = 1:num_ports
    s11_val = S(n,n,f0_idx);
    s11_dB = 20*log10(abs(s11_val));
    Z = port{n}.uf.tot(f0_idx) / port{n}.if.tot(f0_idx);
    vswr = (1 + abs(s11_val)) / (1 - abs(s11_val));
    metrics(n,:) = [s11_dB, real(Z), imag(Z), vswr];
end

% Display table
text(0.1, 0.95, 'Performance at 2.4 GHz', 'FontSize', 12, 'FontWeight', 'bold');
text(0.1, 0.85, 'Port | S11(dB) | Re(Z) | Im(Z) | VSWR', 'FontSize', 10);
text(0.1, 0.80, '-----|---------|-------|-------|------', 'FontSize', 10);
for n = 1:num_ports
    text(0.1, 0.80-n*0.08, sprintf(' %d   | %6.1f  | %5.1f | %5.1f | %4.2f', ...
         n, metrics(n,1), metrics(n,2), metrics(n,3), metrics(n,4)), 'FontSize', 10);
end
axis off;

% 9. Array characteristics
subplot(3,3,9);
text(0.1, 0.9, 'Array Characteristics', 'FontSize', 12, 'FontWeight', 'bold');
text(0.1, 0.75, sprintf('Center frequency: 2.4 GHz'), 'FontSize', 11);
text(0.1, 0.65, sprintf('Array size: %.1f × %.1f mm', array.size, array.size), 'FontSize', 11);
text(0.1, 0.55, sprintf('Element spacing: %.1f mm (%.2fλ)', array.spacing, array.spacing/lambda0), 'FontSize', 11);
text(0.1, 0.45, sprintf('Substrate: FR-4 (εr=%.1f, h=%.3fmm)', substrate.er, substrate.h), 'FontSize', 11);
text(0.1, 0.35, sprintf('Patch size: %.1f × %.1f mm', patch.W, patch.L), 'FontSize', 11);

% Array gain estimate
single_gain = 7;  % dBi for single patch
array_factor = 10*log10(9);  % Ideal array factor
mutual_coupling_loss = 1;  % dB estimate
estimated_gain = single_gain + array_factor - mutual_coupling_loss;
text(0.1, 0.2, sprintf('Estimated gain: %.1f dBi', estimated_gain), 'FontSize', 11, 'FontWeight', 'bold');
text(0.1, 0.1, sprintf('3dB beamwidth: ~%.0f°', 65/sqrt(9)), 'FontSize', 11);
axis off;

% Overall title
sgtitle('Realistic 3x3 Patch Array @ 2.4 GHz - Complete S-Parameter Analysis', ...
        'FontSize', 16, 'FontWeight', 'bold');

% Save figure
saveas(gcf, [Sim_Path '/complete_results.png']);

%% PART 5: EXPORT S-PARAMETERS
fprintf('\n=== Exporting S-Parameters ===\n');

% Create Touchstone file (.s9p)
filename = [Sim_Path '/array_3x3.s9p'];
fid = fopen(filename, 'w');

% Write header
fprintf(fid, '! 3x3 Patch Antenna Array\n');
fprintf(fid, '! Generated by OpenEMS\n');
fprintf(fid, '# GHz S MA R 50\n');

% Write S-parameters
for f_idx = 1:length(freq)
    fprintf(fid, '%.6f', freq(f_idx)/1e9);
    for i = 1:num_ports
        for j = 1:num_ports
            mag = abs(S(i,j,f_idx));
            phase = angle(S(i,j,f_idx)) * 180/pi;
            fprintf(fid, ' %.6f %.2f', mag, phase);
        end
    end
    fprintf(fid, '\n');
end
fclose(fid);

% Also save as MATLAB file
save([Sim_Path '/s_parameters.mat'], 'S', 'freq', 'port', 'metrics');

% Create CSV summary
csvfile = [Sim_Path '/s_param_summary.csv'];
fid = fopen(csvfile, 'w');
fprintf(fid, 'Frequency(GHz)');
for i = 1:num_ports
    for j = 1:num_ports
        fprintf(fid, ',S%d%d_mag,S%d%d_phase', i, j, i, j);
    end
end
fprintf(fid, '\n');

% Sample at key frequencies
key_freqs = [2.3, 2.35, 2.4, 2.45, 2.5] * 1e9;
for kf = key_freqs
    [~, idx] = min(abs(freq - kf));
    fprintf(fid, '%.3f', kf/1e9);
    for i = 1:num_ports
        for j = 1:num_ports
            mag = abs(S(i,j,idx));
            phase = angle(S(i,j,idx)) * 180/pi;
            fprintf(fid, ',%.4f,%.1f', mag, phase);
        end
    end
    fprintf(fid, '\n');
end
fclose(fid);

fprintf('\nFiles saved:\n');
fprintf('  - %s (Touchstone format)\n', filename);
fprintf('  - %s/s_parameters.mat (MATLAB format)\n', Sim_Path);
fprintf('  - %s (CSV summary)\n', csvfile);
fprintf('  - %s/complete_results.png (Visualization)\n', Sim_Path);

fprintf('\n=== Simulation Complete ===\n');
