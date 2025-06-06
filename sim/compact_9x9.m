% Compact 9x9 Patch Antenna Array - Complete Simulation & Visualization
% WARNING: This requires significant RAM (8-16 GB) and time (20-40 minutes)

clear; close all; clc;

% Add paths
addpath('/files/tools/openEMS/matlab');
addpath('/files/tools/CSXCAD/matlab');

%% PART 1: SETUP & SIMULATION
fprintf('Setting up 9x9 patch antenna array (81 elements)...\n');
fprintf('WARNING: This simulation requires 8-16 GB RAM and 20-40 minutes\n\n');

% Initialize with optimizations for large array
FDTD = InitFDTD(50000, 5e-3);  % Relaxed convergence criteria for speed
FDTD = SetGaussExcite(FDTD, 2.4e9, 0.2e9);  % Narrower bandwidth
FDTD = SetBoundaryCond(FDTD, {'MUR', 'MUR', 'MUR', 'MUR', 'MUR', 'MUR'});
CSX = InitCSX();

% Materials
CSX = AddMaterial(CSX, 'FR4');
CSX = SetMaterialProperty(CSX, 'FR4', 'Epsilon', 4.3);
CSX = AddMetal(CSX, 'copper');

% Create 9x9 array
spacing = 62.5;  % 0.5 lambda at 2.4 GHz
fprintf('Creating 81 patch elements...\n');
for i = 1:9
    for j = 1:9
        x = (i-5) * spacing;  % Center array at origin
        y = (j-5) * spacing;
        
        % Patch (38x30 mm)
        CSX = AddBox(CSX, 'copper', 10, [x-19, y-15, 1.6], [x+19, y+15, 1.6]);
        
        % Single port on center element (5,5)
        if i==5 && j==5
            [CSX, port] = AddLumpedPort(CSX, 20, 1, 50, [x-1.5, y-15, 0], [x+1.5, y-15, 1.6], [0 0 1], true);
        end
    end
end

% Large substrate & ground for 9x9
box_size = 300;  % Much larger for 9x9
CSX = AddBox(CSX, 'FR4', 1, [-box_size, -box_size, 0], [box_size, box_size, 1.6]);
CSX = AddBox(CSX, 'copper', 10, [-box_size, -box_size, 0], [box_size, box_size, 0]);

% Coarse mesh for manageable simulation time
mesh_res = 20;  % Very coarse mesh
mesh.x = [-box_size:mesh_res:box_size];
mesh.y = mesh.x;
mesh.z = [0, 1.6, 30];
CSX = DefineRectGrid(CSX, 1e-3, mesh);

% Run simulation
Sim_Path = 'compact_9x9';
mkdir(Sim_Path);
WriteOpenEMS([Sim_Path '/sim.xml'], FDTD, CSX);

fprintf('Running simulation (this will take 20-40 minutes)...\n');
fprintf('Started at: %s\n', datestr(now));
tic;
RunOpenEMS(Sim_Path, 'sim.xml');
elapsed = toc;
fprintf('Simulation completed in %.1f minutes\n\n', elapsed/60);

%% PART 2: VISUALIZATION
fprintf('Generating visualizations...\n');

% Calculate S-parameters (reduced frequency points for speed)
freq = linspace(2.3e9, 2.5e9, 41);  % Fewer points
port = calcPort(port, Sim_Path, freq);
s11 = port.uf.ref ./ port.uf.inc;
Z = port.uf.tot ./ port.if.tot;

% Create single figure with all results
figure('Position', [100 100 1400 700], 'Name', '9x9 Array Results');

% S11 plot
subplot(2,4,1);
plot(freq/1e9, 20*log10(abs(s11)), 'b-', 'LineWidth', 2);
grid on; xlabel('Frequency (GHz)'); ylabel('S11 (dB)');
title('Return Loss');
ylim([-25 0]);
hold on; plot([2.3 2.5], [-10 -10], 'r--');

% Find resonance
[min_s11, idx] = min(abs(s11));
plot(freq(idx)/1e9, 20*log10(min_s11), 'ro', 'MarkerSize', 8);
text(freq(idx)/1e9, 20*log10(min_s11)+2, sprintf('%.3f GHz', freq(idx)/1e9));

% Smith Chart
subplot(2,4,2);
theta = linspace(0, 2*pi, 100);
plot(cos(theta), sin(theta), 'k-'); hold on;
plot([-1 1], [0 0], 'k-'); plot([0 0], [-1 1], 'k-');
plot(0.5*cos(theta), 0.5*sin(theta), 'k:', 'LineWidth', 0.5);
plot(real(s11), imag(s11), 'b-', 'LineWidth', 2);
plot(real(s11(idx)), imag(s11(idx)), 'ro', 'MarkerSize', 8);
axis equal; xlim([-1.2 1.2]); ylim([-1.2 1.2]);
title('S11 Smith Chart'); grid on;

% Impedance
subplot(2,4,3);
plot(freq/1e9, real(Z), 'b-', freq/1e9, imag(Z), 'r-', 'LineWidth', 2);
hold on; plot([2.3 2.5], [50 50], 'k--');
plot([2.3 2.5], [0 0], 'k--');
xlabel('Frequency (GHz)'); ylabel('Impedance (Ω)');
title('Input Impedance');
legend('Real', 'Imag', 'Location', 'northeast');
grid on;

% Array layout visualization (simplified for 9x9)
subplot(2,4,4);
% Draw grid representation
for i = 1:9
    for j = 1:9
        x = (i-5) * 15;  % Scaled down for visualization
        y = (j-5) * 15;
        if i==5 && j==5
            rectangle('Position', [x-6, y-5, 12, 10], 'FaceColor', [0.8 0.2 0.2]);
            text(x, y-8, 'Port', 'HorizontalAlignment', 'center', 'FontSize', 6);
        else
            rectangle('Position', [x-6, y-5, 12, 10], 'FaceColor', [0.8 0.8 0.8]);
        end
        hold on;
    end
end
axis equal; xlim([-70 70]); ylim([-70 70]);
xlabel('Array Column'); ylabel('Array Row');
title('9x9 Array Layout (81 Elements)');
set(gca, 'XTick', -60:15:60, 'XTickLabel', 1:9);
set(gca, 'YTick', -60:15:60, 'YTickLabel', 1:9);
grid on;

% Array factor pattern (theoretical)
subplot(2,4,5);
theta_cut = linspace(-90, 90, 181);
k = 2*pi*2.4e9/3e8;
d = spacing * 1e-3;
AF = zeros(size(theta_cut));
for t = 1:length(theta_cut)
    AF_sum = 0;
    for n = 1:9
        phase = k * d * (n-5) * sin(theta_cut(t)*pi/180);
        AF_sum = AF_sum + exp(1j*phase);
    end
    AF(t) = abs(AF_sum)^2;  % Power pattern
end
AF_dB = 10*log10(AF/max(AF));
plot(theta_cut, AF_dB, 'b-', 'LineWidth', 2);
grid on; xlabel('Angle (degrees)'); ylabel('Array Factor (dB)');
title('Theoretical Array Factor (H-plane)');
ylim([-30 0]);
hold on; plot([-90 90], [-3 -3], 'r--');

% Beamwidth calculation
idx_3dB = find(AF_dB >= -3);
beamwidth = theta_cut(idx_3dB(end)) - theta_cut(idx_3dB(1));
text(0, -25, sprintf('3dB BW: %.1f°', beamwidth), 'HorizontalAlignment', 'center');

% Performance summary
subplot(2,4,6);
text(0.1, 0.95, '9x9 ARRAY PERFORMANCE', 'FontSize', 14, 'FontWeight', 'bold');
text(0.1, 0.85, sprintf('Elements: 81'), 'FontSize', 12);
text(0.1, 0.75, sprintf('Resonance: %.3f GHz', freq(idx)/1e9), 'FontSize', 12);
text(0.1, 0.65, sprintf('S11: %.1f dB', 20*log10(min_s11)), 'FontSize', 12);
text(0.1, 0.55, sprintf('Z at f₀: %.1f %+.1fj Ω', real(Z(idx)), imag(Z(idx))), 'FontSize', 12);

% Bandwidth
bw_idx = find(20*log10(abs(s11)) < -10);
if ~isempty(bw_idx)
    bw = freq(bw_idx(end)) - freq(bw_idx(1));
    text(0.1, 0.45, sprintf('BW: %.1f MHz', bw/1e6), 'FontSize', 12);
end

% Array characteristics
single_patch_gain = 7;  % dBi typical
array_gain = single_patch_gain + 10*log10(81);
text(0.1, 0.35, sprintf('Est. Gain: %.1f dBi', array_gain), 'FontSize', 12);
text(0.1, 0.25, sprintf('3dB Beamwidth: %.1f°', beamwidth), 'FontSize', 12);

if 20*log10(min_s11) < -10
    text(0.1, 0.1, 'Status: MATCHED', 'FontSize', 12, 'Color', 'green', 'FontWeight', 'bold');
else
    text(0.1, 0.1, 'Status: MISMATCHED', 'FontSize', 12, 'Color', 'red', 'FontWeight', 'bold');
end
axis off;

% Comparison table
subplot(2,4,7);
text(0.1, 0.9, 'ARRAY COMPARISON', 'FontSize', 12, 'FontWeight', 'bold');
text(0.1, 0.75, 'Array | Elements | Gain | Beamwidth', 'FontSize', 10);
text(0.1, 0.65, '------|----------|------|----------', 'FontSize', 10);
text(0.1, 0.55, sprintf(' 2x2  |    4     | %.1f  |   ~30°', single_patch_gain + 10*log10(4)), 'FontSize', 10);
text(0.1, 0.45, sprintf(' 3x3  |    9     | %.1f  |   ~20°', single_patch_gain + 10*log10(9)), 'FontSize', 10);
text(0.1, 0.35, sprintf(' 9x9  |   81     | %.1f  |   ~%.0f°', array_gain, beamwidth), 'FontSize', 10);
axis off;

% Simulation stats
subplot(2,4,8);
text(0.1, 0.9, 'SIMULATION STATS', 'FontSize', 12, 'FontWeight', 'bold');
text(0.1, 0.75, sprintf('Simulation time: %.1f min', elapsed/60), 'FontSize', 10);
text(0.1, 0.65, sprintf('Mesh cells: ~%.0fk', (length(mesh.x)*length(mesh.y)*length(mesh.z))/1000), 'FontSize', 10);
text(0.1, 0.55, sprintf('Memory usage: ~%.1f GB', (length(mesh.x)*length(mesh.y)*length(mesh.z)*8*10)/1e9), 'FontSize', 10);
text(0.1, 0.35, 'Tips for faster simulation:', 'FontSize', 10, 'FontWeight', 'bold');
text(0.1, 0.25, '• Use coarser mesh', 'FontSize', 9);
text(0.1, 0.15, '• Reduce max timesteps', 'FontSize', 9);
text(0.1, 0.05, '• Use symmetry (simulate 1/4)', 'FontSize', 9);
axis off;

% Overall title
axes('Position', [0 0 1 1], 'Visible', 'off');
text(0.5, 0.98, '9x9 Patch Antenna Array @ 2.4 GHz (81 Elements)', ...
     'HorizontalAlignment', 'center', 'FontSize', 16, 'FontWeight', 'bold');

% Save results
saveas(gcf, [Sim_Path '/results.png']);
fprintf('\nResults saved to: %s/results.png\n', Sim_Path);
fprintf('\n=== Key Results ===\n');
fprintf('Array gain: %.1f dBi (theoretical)\n', array_gain);
fprintf('Beamwidth: %.1f degrees\n', beamwidth);
fprintf('First sidelobe: %.1f dB\n', max(AF_dB(AF_dB<-10)));


