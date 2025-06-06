% Clean 3x3 Patch Antenna Array Simulation
% Complete simulation with integrated visualization
% Optimized for 2.4 GHz WiFi band

clear; close all; clc;

% Add paths
addpath('/files/tools/openEMS/matlab');
addpath('/files/tools/CSXCAD/matlab');

%% PART 1: SETUP AND DESIGN
fprintf('=== 3x3 Patch Antenna Array Simulation ===\n');
fprintf('Target Frequency: 2.4 GHz\n\n');

% Constants
c0 = 299792458;
f0 = 2.4e9;
unit = 1e-3;

% Substrate properties (FR-4)
substrate_er = 4.3;
substrate_h = 1.6;
substrate_tand = 0.02;

% Calculate patch dimensions
Er_eff = (substrate_er + 1)/2 + (substrate_er - 1)/2 * (1 + 12*substrate_h/30)^(-0.5);
lambda_g = c0/f0/sqrt(Er_eff) * 1000;  % mm

% Patch dimensions (optimized for 2.4 GHz)
patch_length = 29.5;   % mm
patch_width = 37.8;    % mm
feed_width = 3.0;      % mm
feed_inset = 8.5;      % mm

% Array configuration
element_spacing = 62.5;  % 0.5 lambda at 2.4 GHz
num_elements = 3;        % 3x3 array

fprintf('Patch dimensions: %.1f x %.1f mm\n', patch_width, patch_length);
fprintf('Array spacing: %.1f mm\n', element_spacing);
fprintf('Total array size: %.1f x %.1f mm\n\n', element_spacing*2, element_spacing*2);

%% PART 2: BUILD SIMULATION
% Initialize FDTD
FDTD = InitFDTD('NrTS', 30000, 'EndCriteria', 1e-4);
FDTD = SetGaussExcite(FDTD, f0, f0/5);
FDTD = SetBoundaryCond(FDTD, {'MUR', 'MUR', 'MUR', 'MUR', 'MUR', 'MUR'});

% Initialize geometry
CSX = InitCSX();

% Define materials
CSX = AddMaterial(CSX, 'substrate');
CSX = SetMaterialProperty(CSX, 'substrate', 'Epsilon', substrate_er);
CSX = SetMaterialProperty(CSX, 'substrate', 'Kappa', substrate_tand*2*pi*f0*8.854e-12*substrate_er);
CSX = AddMetal(CSX, 'copper');

% Ground plane size
gnd_size = 150;

% Create substrate
CSX = AddBox(CSX, 'substrate', 1, [-gnd_size/2, -gnd_size/2, 0], [gnd_size/2, gnd_size/2, substrate_h]);

% Create ground plane
CSX = AddBox(CSX, 'copper', 10, [-gnd_size/2, -gnd_size/2, 0], [gnd_size/2, gnd_size/2, 0]);

% Create 3x3 array with CENTER ELEMENT ONLY excited
fprintf('Creating 3x3 array (exciting center element only)...\n');
port_num = 1;
for i = 1:num_elements
    for j = 1:num_elements
        % Calculate position
        x_pos = (i - 2) * element_spacing;
        y_pos = (j - 2) * element_spacing;
        
        % Create patch
        CSX = AddBox(CSX, 'copper', 10, ...
            [x_pos - patch_width/2, y_pos - patch_length/2, substrate_h], ...
            [x_pos + patch_width/2, y_pos + patch_length/2, substrate_h]);
        
        % Add port only to center element (2,2)
        if i == 2 && j == 2
            % Create inset feed
            CSX = AddBox(CSX, 'copper', 10, ...
                [x_pos - feed_width/2, y_pos - patch_length/2, substrate_h], ...
                [x_pos + feed_width/2, y_pos - patch_length/2 + feed_inset, substrate_h]);
            
            % Add lumped port
            [CSX, port] = AddLumpedPort(CSX, 20, port_num, 50, ...
                [x_pos - feed_width/2, y_pos - patch_length/2, 0], ...
                [x_pos + feed_width/2, y_pos - patch_length/2, substrate_h], ...
                [0 0 1], true);
            
            fprintf('  Port added to center element (2,2)\n');
        end
    end
end

% Setup mesh
mesh = [];
mesh.x = [-gnd_size/2];
mesh.y = [-gnd_size/2];
mesh.z = [0, substrate_h];

% Add mesh lines for patches
for i = 1:num_elements
    x = (i - 2) * element_spacing;
    mesh.x = [mesh.x, x - patch_width/2 - 2, x - patch_width/2, x + patch_width/2, x + patch_width/2 + 2];
end

for j = 1:num_elements
    y = (j - 2) * element_spacing;
    mesh.y = [mesh.y, y - patch_length/2 - 2, y - patch_length/2, y + patch_length/2, y + patch_length/2 + 2];
end

mesh.x = [mesh.x, gnd_size/2];
mesh.y = [mesh.y, gnd_size/2];
mesh.z = [mesh.z, 3, 10, 20];

% Clean and sort mesh
mesh.x = sort(unique(mesh.x));
mesh.y = sort(unique(mesh.y));

% Apply mesh
CSX = DefineRectGrid(CSX, unit, mesh);

% Prepare simulation
Sim_Path = 'clean_3x3_array';
Sim_CSX = 'array.xml';

% Create directory
[status, message] = mkdir(Sim_Path);

% Write CSX
WriteOpenEMS([Sim_Path '/' Sim_CSX], FDTD, CSX);

% View geometry (optional)
% CSXGeomPlot([Sim_Path '/' Sim_CSX]);

%% PART 3: RUN SIMULATION
fprintf('\nRunning simulation...\n');
tic;
RunOpenEMS(Sim_Path, Sim_CSX);
toc;

%% PART 4: POST-PROCESSING AND VISUALIZATION
fprintf('\n=== Post-Processing ===\n');

% Frequency range
freq = linspace(2.0e9, 2.8e9, 161);

% Calculate port parameters
port = calcPort(port, Sim_Path, freq);

% Extract S11
s11 = port.uf.ref ./ port.uf.inc;
s11_dB = 20*log10(abs(s11));

% Extract impedance
Z = port.uf.tot ./ port.if.tot;

% Find resonance
[min_s11, min_idx] = min(s11_dB);
f_res = freq(min_idx);

% Find bandwidth
bw_idx = find(s11_dB < -10);
if ~isempty(bw_idx)
    f_low = freq(bw_idx(1));
    f_high = freq(bw_idx(end));
    bandwidth = (f_high - f_low) / 1e6;  % MHz
    fractional_bw = (f_high - f_low) / f_res * 100;  % %
else
    bandwidth = 0;
    fractional_bw = 0;
end

%% PART 5: VISUALIZATION
fprintf('\nCreating visualizations...\n');

figure('Position', [100 100 1200 800], 'Name', '3x3 Array Results');

% 1. S11 vs Frequency
subplot(2,3,1);
plot(freq/1e9, s11_dB, 'b-', 'LineWidth', 2);
hold on;
plot([2.0 2.8], [-10 -10], 'r--', 'LineWidth', 1);
plot(f_res/1e9, min_s11, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
grid on;
xlabel('Frequency (GHz)');
ylabel('S11 (dB)');
title('Return Loss');
ylim([-30 0]);
text(f_res/1e9, min_s11-2, sprintf('%.3f GHz\n%.1f dB', f_res/1e9, min_s11), ...
     'HorizontalAlignment', 'center', 'FontSize', 10);

% 2. Smith Chart
subplot(2,3,2);
% Draw Smith chart grid
theta = linspace(0, 2*pi, 100);
plot(cos(theta), sin(theta), 'k-'); hold on;
plot([-1 1], [0 0], 'k-');
plot([0 0], [-1 1], 'k-');
% Constant resistance circles
r_circles = [0.5, 1, 2];
for r = r_circles
    cx = r/(r+1);
    radius = 1/(r+1);
    plot(cx + radius*cos(theta), radius*sin(theta), 'k:', 'LineWidth', 0.5);
end
% Plot S11
plot(real(s11), imag(s11), 'b-', 'LineWidth', 2);
[~, f24_idx] = min(abs(freq - 2.4e9));
plot(real(s11(f24_idx)), imag(s11(f24_idx)), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
axis equal;
xlim([-1.2 1.2]); ylim([-1.2 1.2]);
title('Smith Chart');
grid on;

% 3. Impedance
subplot(2,3,3);
plot(freq/1e9, real(Z), 'b-', 'LineWidth', 2); hold on;
plot(freq/1e9, imag(Z), 'r-', 'LineWidth', 2);
plot([2.0 2.8], [50 50], 'k--');
plot([2.0 2.8], [0 0], 'k--');
plot(2.4, real(Z(f24_idx)), 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'b');
plot(2.4, imag(Z(f24_idx)), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
grid on;
xlabel('Frequency (GHz)');
ylabel('Impedance (\Omega)');
title('Input Impedance');
legend('Real', 'Imag', 'Location', 'northeast');
ylim([-50 150]);

% 4. VSWR
subplot(2,3,4);
vswr = (1 + abs(s11)) ./ (1 - abs(s11));
plot(freq/1e9, vswr, 'b-', 'LineWidth', 2);
hold on;
plot([2.0 2.8], [2 2], 'r--', 'LineWidth', 1);
grid on;
xlabel('Frequency (GHz)');
ylabel('VSWR');
title('Voltage Standing Wave Ratio');
ylim([1 5]);

% 5. Array Layout
subplot(2,3,5);
% Draw patches
for i = 1:3
    for j = 1:3
        x = (i - 2) * element_spacing;
        y = (j - 2) * element_spacing;
        
        if i == 2 && j == 2
            % Center element (excited)
            color = [0.8 0.2 0.2];
            rectangle('Position', [x-patch_width/2, y-patch_length/2, patch_width, patch_length], ...
                     'FaceColor', color, 'EdgeColor', 'k', 'LineWidth', 2);
            % Show feed
            rectangle('Position', [x-feed_width/2, y-patch_length/2, feed_width, feed_inset], ...
                     'FaceColor', [1 0 0], 'EdgeColor', 'k');
            text(x, y, 'PORT', 'HorizontalAlignment', 'center', ...
                 'FontWeight', 'bold', 'FontSize', 10);
        else
            % Other elements
            color = [0.7 0.7 0.7];
            rectangle('Position', [x-patch_width/2, y-patch_length/2, patch_width, patch_length], ...
                     'FaceColor', color, 'EdgeColor', 'k', 'LineWidth', 1);
            text(x, y, sprintf('(%d,%d)', i, j), 'HorizontalAlignment', 'center', ...
                 'FontSize', 9);
        end
        hold on;
    end
end
% Ground plane outline
rectangle('Position', [-gnd_size/2, -gnd_size/2, gnd_size, gnd_size], ...
         'EdgeColor', 'k', 'LineWidth', 2, 'LineStyle', '--');
axis equal;
xlabel('X (mm)'); ylabel('Y (mm)');
title('3x3 Array Layout');
grid on;
xlim([-80 80]); ylim([-80 80]);

% 6. Performance Summary
subplot(2,3,6);
summary_str = sprintf('3x3 ARRAY PERFORMANCE\n\n');
summary_str = [summary_str sprintf('Design Frequency: 2.4 GHz\n')];
summary_str = [summary_str sprintf('Substrate: FR-4 (εr=%.1f)\n', substrate_er)];
summary_str = [summary_str sprintf('Elements: 9 (3×3)\n')];
summary_str = [summary_str sprintf('Spacing: %.1f mm (0.5λ)\n\n', element_spacing)];

summary_str = [summary_str sprintf('RESULTS:\n')];
summary_str = [summary_str sprintf('Resonance: %.3f GHz\n', f_res/1e9)];
summary_str = [summary_str sprintf('S11 at resonance: %.1f dB\n', min_s11)];
summary_str = [summary_str sprintf('S11 at 2.4 GHz: %.1f dB\n', s11_dB(f24_idx))];
summary_str = [summary_str sprintf('Z at 2.4 GHz: %.1f %+.1fj Ω\n', real(Z(f24_idx)), imag(Z(f24_idx)))];

if bandwidth > 0
    summary_str = [summary_str sprintf('\n10 dB Bandwidth: %.1f MHz (%.1f%%)\n', bandwidth, fractional_bw)];
    summary_str = [summary_str sprintf('Freq range: %.3f - %.3f GHz\n', f_low/1e9, f_high/1e9)];
end

% Array characteristics
array_gain = 7 + 10*log10(9);  % Theoretical
beamwidth = 65/3;  % Approximate
summary_str = [summary_str sprintf('\nESTIMATED ARRAY:\n')];
summary_str = [summary_str sprintf('Gain: %.1f dBi\n', array_gain)];
summary_str = [summary_str sprintf('3dB Beamwidth: ~%.0f°\n', beamwidth)];

text(0.05, 0.95, summary_str, 'VerticalAlignment', 'top', 'FontSize', 10);

% Status indicator
if s11_dB(f24_idx) < -10
    status = 'MATCHED';
    status_color = [0 0.7 0];
else
    status = 'MISMATCHED';
    status_color = [0.8 0 0];
end
text(0.05, 0.08, 'Status: ', 'FontSize', 12, 'FontWeight', 'bold');
text(0.25, 0.08, status, 'FontSize', 12, 'FontWeight', 'bold', 'Color', status_color);

axis off;

% Overall title
axes('Position', [0 0 1 1], 'Visible', 'off');
text(0.5, 0.98, '3x3 Patch Antenna Array @ 2.4 GHz', ...
     'HorizontalAlignment', 'center', 'FontSize', 16, 'FontWeight', 'bold');

% Save results
print('-dpng', '-r150', [Sim_Path '/results.png']);

%% PART 6: SAVE DATA
save([Sim_Path '/simulation_data.mat'], 'freq', 's11', 's11_dB', 'Z', 'f_res', 'bandwidth');

% Export S-parameters to touchstone format
fid = fopen([Sim_Path '/array_3x3.s1p'], 'w');
fprintf(fid, '# GHz S MA R 50\n');
fprintf(fid, '! 3x3 Patch Array Center Element\n');
for k = 1:length(freq)
    fprintf(fid, '%.6f %.6f %.2f\n', freq(k)/1e9, abs(s11(k)), angle(s11(k))*180/pi);
end
fclose(fid);

fprintf('\n=== Results Summary ===\n');
fprintf('Resonant frequency: %.3f GHz\n', f_res/1e9);
fprintf('S11 at resonance: %.1f dB\n', min_s11);
fprintf('S11 at 2.4 GHz: %.1f dB\n', s11_dB(f24_idx));
fprintf('10 dB bandwidth: %.1f MHz\n', bandwidth);
fprintf('\nFiles saved in: %s/\n', Sim_Path);
fprintf('  - results.png (visualization)\n');
fprintf('  - simulation_data.mat (MATLAB data)\n');
fprintf('  - array_3x3.s1p (Touchstone format)\n');

fprintf('\n=== Simulation Complete ===\n');
