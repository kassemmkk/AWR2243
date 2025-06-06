% Compact 3x3 Patch Antenna Array - Complete Simulation & Visualization
% Run time: ~3-5 minutes

clear; close all; clc;

% Add paths
addpath('/files/tools/openEMS/matlab');
addpath('/files/tools/CSXCAD/matlab');

%% PART 1: SETUP & SIMULATION
fprintf('Setting up 3x3 patch antenna array...\n');

% Initialize
FDTD = InitFDTD(30000, 1e-3);  % Increased timesteps for larger array
FDTD = SetGaussExcite(FDTD, 2.4e9, 0.3e9);
FDTD = SetBoundaryCond(FDTD, {'MUR', 'MUR', 'MUR', 'MUR', 'MUR', 'MUR'});
CSX = InitCSX();

% Materials
CSX = AddMaterial(CSX, 'FR4');
CSX = SetMaterialProperty(CSX, 'FR4', 'Epsilon', 4.3);
CSX = AddMetal(CSX, 'copper');

% Create 3x3 array
spacing = 62.5;  % 0.5 lambda at 2.4 GHz
for i = 1:3
    for j = 1:3
        x = (i-2) * spacing;  % Center array at origin
        y = (j-2) * spacing;
        
        % Patch (38x30 mm)
        CSX = AddBox(CSX, 'copper', 10, [x-19, y-15, 1.6], [x+19, y+15, 1.6]);
        
        % Single port on center element (2,2)
        if i==2 && j==2
            [CSX, port] = AddLumpedPort(CSX, 20, 1, 50, [x-1.5, y-15, 0], [x+1.5, y-15, 1.6], [0 0 1], true);
        end
    end
end

% Larger substrate & ground for 3x3
box_size = 110;  % Increased from 70
CSX = AddBox(CSX, 'FR4', 1, [-box_size, -box_size, 0], [box_size, box_size, 1.6]);
CSX = AddBox(CSX, 'copper', 10, [-box_size, -box_size, 0], [box_size, box_size, 0]);

% Simple mesh - slightly coarser for speed
mesh.x = [-box_size:12:box_size];  % Increased step size
mesh.y = mesh.x;
mesh.z = [0, 1.6, 20];
CSX = DefineRectGrid(CSX, 1e-3, mesh);

% Run simulation
Sim_Path = 'compact_3x3';
mkdir(Sim_Path);
WriteOpenEMS([Sim_Path '/sim.xml'], FDTD, CSX);

fprintf('Running simulation (this may take 3-5 minutes)...\n');
tic;
RunOpenEMS(Sim_Path, 'sim.xml');
fprintf('Simulation completed in %.1f seconds\n\n', toc);

%% PART 2: VISUALIZATION
fprintf('Generating visualizations...\n');

% Calculate S-parameters
freq = linspace(2.2e9, 2.6e9, 51);
port = calcPort(port, Sim_Path, freq);
s11 = port.uf.ref ./ port.uf.inc;
Z = port.uf.tot ./ port.if.tot;

% Create single figure with all results
figure('Position', [100 100 1200 600], 'Name', '3x3 Array Results');

% S11 plot
subplot(2,3,1);
plot(freq/1e9, 20*log10(abs(s11)), 'b-', 'LineWidth', 2);
grid on; xlabel('Frequency (GHz)'); ylabel('S11 (dB)');
title('Return Loss');
ylim([-25 0]);
hold on; plot([2.2 2.6], [-10 -10], 'r--');

% Find resonance
[min_s11, idx] = min(abs(s11));
plot(freq(idx)/1e9, 20*log10(min_s11), 'ro', 'MarkerSize', 8);
text(freq(idx)/1e9, 20*log10(min_s11)+2, sprintf('%.3f GHz', freq(idx)/1e9));

% Smith Chart
subplot(2,3,2);
% Draw basic Smith chart grid
theta = linspace(0, 2*pi, 100);
plot(cos(theta), sin(theta), 'k-'); hold on;
plot([-1 1], [0 0], 'k-'); plot([0 0], [-1 1], 'k-');
plot(0.5*cos(theta), 0.5*sin(theta), 'k:', 'LineWidth', 0.5);
% Plot S11
plot(real(s11), imag(s11), 'b-', 'LineWidth', 2);
plot(real(s11(idx)), imag(s11(idx)), 'ro', 'MarkerSize', 8);
axis equal; xlim([-1.2 1.2]); ylim([-1.2 1.2]);
title('S11 Smith Chart'); grid on;

% Impedance
subplot(2,3,3);
plot(freq/1e9, real(Z), 'b-', freq/1e9, imag(Z), 'r-', 'LineWidth', 2);
hold on; plot([2.2 2.6], [50 50], 'k--');
plot([2.2 2.6], [0 0], 'k--');
xlabel('Frequency (GHz)'); ylabel('Impedance (Ω)');
title('Input Impedance');
legend('Real', 'Imag', 'Location', 'northeast');
grid on;

% Array layout visualization
subplot(2,3,4);
colors = [0.8 0.8 0.8; 0.8 0.6 0.2];  % Gray for non-excited, brown for excited
for i = 1:3
    for j = 1:3
        x = (i-2) * spacing;
        y = (j-2) * spacing;
        if i==2 && j==2
            color = colors(2,:);  % Excited element
        else
            color = colors(1,:);  % Non-excited elements
        end
        rectangle('Position', [x-19, y-15, 38, 30], 'FaceColor', color);
        hold on;
        text(x, y, sprintf('(%d,%d)', i, j), 'HorizontalAlignment', 'center', 'FontSize', 8);
        if i==2 && j==2
            plot(x, y-15, 'r^', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
        end
    end
end
rectangle('Position', [-box_size, -box_size, 2*box_size, 2*box_size], 'EdgeColor', 'k', 'LineWidth', 2);
axis equal; xlim([-box_size-10 box_size+10]); ylim([-box_size-10 box_size+10]);
xlabel('X (mm)'); ylabel('Y (mm)');
title('3x3 Array Layout (Center Element Excited)');
grid on;

% Time domain
subplot(2,3,5);
try
    [port_ut] = ReadUI([Sim_Path '/port_ut1']);
    plot(port_ut.TD.t*1e9, port_ut.TD.val, 'b-', 'LineWidth', 1.5);
    xlabel('Time (ns)'); ylabel('Voltage (V)');
    title('Port Excitation Signal');
    grid on; xlim([0 2]);
catch
    % Alternative if ReadUI fails
    text(0.5, 0.5, 'Time domain data not available', 'HorizontalAlignment', 'center');
    axis off;
end

% Performance summary
subplot(2,3,6);
text(0.1, 0.9, '3x3 ARRAY PERFORMANCE', 'FontSize', 14, 'FontWeight', 'bold');
text(0.1, 0.7, sprintf('Resonance: %.3f GHz', freq(idx)/1e9), 'FontSize', 12);
text(0.1, 0.6, sprintf('S11: %.1f dB', 20*log10(min_s11)), 'FontSize', 12);
text(0.1, 0.5, sprintf('Z at f₀: %.1f %+.1fj Ω', real(Z(idx)), imag(Z(idx))), 'FontSize', 12);

% Bandwidth
bw_idx = find(20*log10(abs(s11)) < -10);
if ~isempty(bw_idx)
    bw = freq(bw_idx(end)) - freq(bw_idx(1));
    text(0.1, 0.4, sprintf('BW: %.1f MHz', bw/1e6), 'FontSize', 12);
end

% Array gain estimate (theoretical)
single_patch_gain = 7;  % dBi typical
array_factor = 10*log10(9);  % 3x3 = 9 elements
estimated_gain = single_patch_gain + array_factor;
text(0.1, 0.3, sprintf('Est. Gain: %.1f dBi', estimated_gain), 'FontSize', 12);

if 20*log10(min_s11) < -10
    text(0.1, 0.15, 'Status: MATCHED', 'FontSize', 12, 'Color', 'green', 'FontWeight', 'bold');
else
    text(0.1, 0.15, 'Status: MISMATCHED', 'FontSize', 12, 'Color', 'red', 'FontWeight', 'bold');
end
axis off;

% Overall title
axes('Position', [0 0 1 1], 'Visible', 'off');
text(0.5, 0.98, '3x3 Patch Antenna Array @ 2.4 GHz', ...
     'HorizontalAlignment', 'center', 'FontSize', 16, 'FontWeight', 'bold');

% Save results
saveas(gcf, [Sim_Path '/results.png']);
fprintf('\nResults saved to: %s/results.png\n', Sim_Path);

% Array comparison
fprintf('\n=== 3x3 vs 2x2 Comparison ===\n');
fprintf('Elements: 9 vs 4 (2.25x)\n');
fprintf('Theoretical gain increase: %.1f dB\n', 10*log10(9/4));
fprintf('Beamwidth reduction: ~%.0f%%\n', (1-2/3)*100);
