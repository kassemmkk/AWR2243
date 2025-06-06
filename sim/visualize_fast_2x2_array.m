% Comprehensive Visualization of Antenna Array Results
clear; close all;

% Add paths
addpath('/files/tools/openEMS/matlab');
addpath('/files/tools/CSXCAD/matlab');

% Select simulation directory
Sim_Path = 'fast_2x2';  % Change this to your simulation directory

%% 1. Interactive Geometry Visualization
fprintf('=== 1. GEOMETRY VISUALIZATION ===\n');
fprintf('Opening 3D geometry viewer...\n');
CSXGeomPlot([Sim_Path '/array.xml']);
fprintf('Use mouse to rotate, zoom, and pan the 3D view\n');
fprintf('Close the window when done to continue\n\n');

%% 2. S-Parameter Results
fprintf('=== 2. S-PARAMETER RESULTS ===\n');

% Read port data
try
    % Read voltage and current
    [port_ut] = ReadUI([Sim_Path '/port_ut1']);
    [port_it] = ReadUI([Sim_Path '/port_it1']);
    
    % Define frequency range
    freq = linspace(2e9, 3e9, 101);
    
    % Setup port structure
    port.drawingunit = 1e-3;
    port.idx = [1, length(port_ut.TD.t)];
    port = calcPort(port, Sim_Path, freq, 'RefImpedance', 50);
    
    % Create figure with subplots
    figure('Position', [100 100 1200 800], 'Name', 'S-Parameter Analysis');
    
    % S11 Magnitude
    subplot(2,2,1);
    s11 = port.uf.ref ./ port.uf.inc;
    s11_db = 20*log10(abs(s11));
    plot(freq/1e9, s11_db, 'b-', 'LineWidth', 2);
    grid on;
    xlabel('Frequency (GHz)');
    ylabel('|S11| (dB)');
    title('Return Loss');
    ylim([-30 0]);
    hold on;
    plot([2 3], [-10 -10], 'r--', 'LineWidth', 1);
    text(2.5, -9, '-10 dB line', 'Color', 'red');
    
    % Find and mark resonances
    [peaks, locs] = findpeaks(-s11_db, 'MinPeakHeight', 10);
    for i = 1:length(locs)
        plot(freq(locs(i))/1e9, s11_db(locs(i)), 'ro', 'MarkerSize', 8);
        text(freq(locs(i))/1e9, s11_db(locs(i))+1, ...
             sprintf('%.3f GHz', freq(locs(i))/1e9), ...
             'HorizontalAlignment', 'center');
    end
    
    % S11 Smith Chart
    subplot(2,2,2);
    smith_chart;
    hold on;
    plot(real(s11), imag(s11), 'b-', 'LineWidth', 2);
    plot(real(s11(1)), imag(s11(1)), 'go', 'MarkerSize', 8);
    plot(real(s11(end)), imag(s11(end)), 'ro', 'MarkerSize', 8);
    title('S11 on Smith Chart');
    text(0.5, 0.9, sprintf('Green: %.1f GHz', freq(1)/1e9), 'Units', 'normalized');
    text(0.5, 0.85, sprintf('Red: %.1f GHz', freq(end)/1e9), 'Units', 'normalized');
    
    % Input Impedance
    Z = port.uf.tot ./ port.if.tot;
    
    subplot(2,2,3);
    plot(freq/1e9, real(Z), 'b-', 'LineWidth', 2);
    hold on;
    plot([2 3], [50 50], 'r--', 'LineWidth', 1);
    grid on;
    xlabel('Frequency (GHz)');
    ylabel('Real(Z) [Ω]');
    title('Input Resistance');
    ylim([0 150]);
    
    subplot(2,2,4);
    plot(freq/1e9, imag(Z), 'b-', 'LineWidth', 2);
    hold on;
    plot([2 3], [0 0], 'r--', 'LineWidth', 1);
    grid on;
    xlabel('Frequency (GHz)');
    ylabel('Imag(Z) [Ω]');
    title('Input Reactance');
    
catch err
    fprintf('Error reading S-parameters: %s\n', err.message);
end

%% 3. Time Domain Analysis
fprintf('\n=== 3. TIME DOMAIN ANALYSIS ===\n');

figure('Position', [150 150 1000 600], 'Name', 'Time Domain Analysis');

try
    % Voltage
    subplot(2,2,1);
    plot(port_ut.TD.t * 1e9, port_ut.TD.val, 'b-');
    xlabel('Time (ns)');
    ylabel('Voltage (V)');
    title('Port Voltage vs Time');
    grid on;
    xlim([0 5]);
    
    % Current
    subplot(2,2,2);
    plot(port_it.TD.t * 1e9, port_it.TD.val * 1000, 'r-');
    xlabel('Time (ns)');
    ylabel('Current (mA)');
    title('Port Current vs Time');
    grid on;
    xlim([0 5]);
    
    % Instantaneous impedance
    subplot(2,2,3);
    Z_t = port_ut.TD.val ./ port_it.TD.val;
    plot(port_ut.TD.t * 1e9, real(Z_t), 'g-');
    xlabel('Time (ns)');
    ylabel('Z(t) [Ω]');
    title('Instantaneous Impedance');
    grid on;
    xlim([0 5]);
    ylim([-200 200]);
    
    % Energy decay
    subplot(2,2,4);
    energy = port_ut.TD.val.^2;
    semilogy(port_ut.TD.t * 1e9, energy/max(energy), 'b-');
    xlabel('Time (ns)');
    ylabel('Normalized Energy');
    title('Signal Decay');
    grid on;
    
catch
    fprintf('Error in time domain analysis\n');
end

%% 4. Performance Summary
fprintf('\n=== 4. PERFORMANCE SUMMARY ===\n');

if exist('s11_db', 'var')
    % Find best S11
    [min_s11, min_idx] = min(s11_db);
    f_res = freq(min_idx);
    
    % Calculate bandwidth
    bw_idx = find(s11_db < -10);
    if ~isempty(bw_idx)
        f_low = freq(bw_idx(1));
        f_high = freq(bw_idx(end));
        bandwidth = f_high - f_low;
        fractional_bw = bandwidth / f_res * 100;
    else
        bandwidth = 0;
        fractional_bw = 0;
    end
    
    % Create summary figure
    figure('Position', [200 200 600 400], 'Name', 'Performance Summary');
    
    % Text summary
    text(0.1, 0.9, 'ANTENNA ARRAY PERFORMANCE', 'FontSize', 16, 'FontWeight', 'bold');
    text(0.1, 0.7, sprintf('Resonant Frequency: %.3f GHz', f_res/1e9), 'FontSize', 12);
    text(0.1, 0.6, sprintf('Return Loss at f₀: %.1f dB', min_s11), 'FontSize', 12);
    text(0.1, 0.5, sprintf('10 dB Bandwidth: %.1f MHz (%.1f%%)', bandwidth/1e6, fractional_bw), 'FontSize', 12);
    text(0.1, 0.4, sprintf('Input Impedance at f₀: %.1f %+.1fj Ω', real(Z(min_idx)), imag(Z(min_idx))), 'FontSize', 12);
    
    if min_s11 < -10
        text(0.1, 0.2, 'Status: GOOD MATCH ✓', 'FontSize', 14, 'Color', 'green', 'FontWeight', 'bold');
    else
        text(0.1, 0.2, 'Status: POOR MATCH ✗', 'FontSize', 14, 'Color', 'red', 'FontWeight', 'bold');
    end
    
    axis off;
end

%% 5. Save Results
fprintf('\n=== 5. SAVING RESULTS ===\n');
save_dir = [Sim_Path '/results'];
mkdir(save_dir);

% Save all figures
figs = findall(0, 'Type', 'figure');
for i = 1:length(figs)
    saveas(figs(i), sprintf('%s/figure_%d.png', save_dir, i));
end

% Save data
if exist('freq', 'var') && exist('s11', 'var')
    save([save_dir '/results.mat'], 'freq', 's11', 'Z');
    
    % Export to CSV
    data = [freq'/1e9, s11_db, real(Z), imag(Z)];
    csvwrite([save_dir '/s_parameters.csv'], data);
    
    fprintf('Results saved to: %s/\n', save_dir);
    fprintf('- PNG figures\n');
    fprintf('- results.mat (MATLAB data)\n');
    fprintf('- s_parameters.csv (for Excel)\n');
end

%% Helper function for Smith Chart
function smith_chart()
    % Simple Smith chart grid
    theta = linspace(0, 2*pi, 100);
    
    % Resistance circles
    r_values = [0, 0.2, 0.5, 1, 2, 5];
    for r = r_values
        cx = r/(r+1);
        cr = 1/(r+1);
        x = cx + cr*cos(theta);
        y = cr*sin(theta);
        plot(x, y, 'k-', 'LineWidth', 0.5);
    end
    
    % Reactance arcs
    x_values = [0.2, 0.5, 1, 2, 5];
    for x = x_values
        % Positive reactance
        ca = 1;
        cb = 1/x;
        t = linspace(0, pi, 50);
        xp = ca + cb*cos(t);
        yp = cb*sin(t);
        plot(xp, yp, 'k-', 'LineWidth', 0.5);
        
        % Negative reactance
        plot(xp, -yp, 'k-', 'LineWidth', 0.5);
    end
    
    % Center line
    plot([-1 1], [0 0], 'k-', 'LineWidth', 1);
    
    axis equal;
    xlim([-1.2 1.2]);
    ylim([-1.2 1.2]);
    grid on;
end

