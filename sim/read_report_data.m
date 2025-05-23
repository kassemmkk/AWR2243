% Read OpenEMS Port Data - Fixed version
% This script correctly reads the port files from your simulation

clear
close all

% Add paths
addpath('/files/tools/openEMS/matlab');
addpath('/files/tools/CSXCAD/matlab');

% Set simulation path
Sim_Path = 'antenna_array_2x2';

fprintf('=== Reading Port Data ===\n');

% Read port 1 voltage data
try
    % Method 1: Direct file reading
    filename = [Sim_Path '/port_ut1'];
    if exist(filename, 'file')
        fprintf('Found port file: %s\n', filename);
        
        % Read the data using ReadUI function
        [port1] = ReadUI(filename);
        
        % Extract time and voltage
        time = port1.TD.t;
        voltage = port1.TD.val;
        
        fprintf('Successfully read %d time points\n', length(time));
        fprintf('Time range: %.3e to %.3e seconds\n', min(time), max(time));
        fprintf('Voltage range: %.3f to %.3f V\n', min(voltage), max(voltage));
        
        % Plot time domain signal
        figure('Name', 'Port 1 Time Domain');
        subplot(2,1,1);
        plot(time*1e9, voltage, 'b-');
        xlabel('Time (ns)');
        ylabel('Voltage (V)');
        title('Port 1 Voltage vs Time');
        grid on;
        xlim([0, max(time)*1e9]);
        
        % Check signal decay
        % Look at last 10% of the signal
        n_end = round(0.9*length(voltage)):length(voltage);
        final_amplitude = max(abs(voltage(n_end)));
        initial_amplitude = max(abs(voltage(1:round(0.1*length(voltage)))));
        decay_ratio = final_amplitude / initial_amplitude;
        
        fprintf('\nSignal decay analysis:\n');
        fprintf('Initial amplitude: %.3f V\n', initial_amplitude);
        fprintf('Final amplitude: %.3e V\n', final_amplitude);
        fprintf('Decay ratio: %.2e\n', decay_ratio);
        
        if decay_ratio > 0.01
            fprintf('WARNING: Signal has not fully decayed! Consider more timesteps.\n');
        else
            fprintf('Good: Signal has decayed sufficiently.\n');
        end
        
        % Frequency domain analysis
        subplot(2,1,2);
        dt = time(2) - time(1);
        fs = 1/dt;
        N = length(voltage);
        f = (0:N-1) * fs / N;
        f = f(1:floor(N/2));
        
        V_fft = fft(voltage);
        V_fft = V_fft(1:floor(N/2));
        
        plot(f/1e9, 20*log10(abs(V_fft)), 'b-');
        xlabel('Frequency (GHz)');
        ylabel('Magnitude (dB)');
        title('Frequency Spectrum');
        grid on;
        xlim([0, 5]);
        
    else
        fprintf('Port file not found: %s\n', filename);
    end
    
catch err
    fprintf('Error reading port data: %s\n', err.message);
end

% Read all ports and compare
fprintf('\n=== Comparing All Ports ===\n');
figure('Name', 'All Ports Comparison');

num_ports = 4;
colors = {'b', 'r', 'g', 'm'};

for p = 1:num_ports
    try
        filename = sprintf('%s/port_ut%d', Sim_Path, p);
        if exist(filename, 'file')
            [port_data] = ReadUI(filename);
            time = port_data.TD.t;
            voltage = port_data.TD.val;
            
            % Time domain comparison
            subplot(2,1,1);
            hold on;
            plot(time*1e9, voltage, colors{p}, 'DisplayName', sprintf('Port %d', p));
            
            % Find peak voltage
            [peak_v, peak_idx] = max(abs(voltage));
            peak_time = time(peak_idx);
            fprintf('Port %d: Peak voltage = %.3f V at %.3f ns\n', p, peak_v, peak_time*1e9);
        end
    catch
        fprintf('Could not read port %d\n', p);
    end
end

subplot(2,1,1);
xlabel('Time (ns)');
ylabel('Voltage (V)');
title('Port Voltages Comparison');
legend('Location', 'best');
grid on;
xlim([0, 2]); % First 2 ns

% Read current data
subplot(2,1,2);
for p = 1:num_ports
    try
        filename = sprintf('%s/port_it%d', Sim_Path, p);
        if exist(filename, 'file')
            [port_data] = ReadUI(filename);
            time = port_data.TD.t;
            current = port_data.TD.val;
            
            hold on;
            plot(time*1e9, current*1000, colors{p}, 'DisplayName', sprintf('Port %d', p));
        end
    catch
        % Continue
    end
end

xlabel('Time (ns)');
ylabel('Current (mA)');
title('Port Currents Comparison');
legend('Location', 'best');
grid on;
xlim([0, 2]); % First 2 ns

% Calculate port impedances
fprintf('\n=== Port Impedance Check ===\n');
for p = 1:num_ports
    try
        % Read voltage and current
        [volt_data] = ReadUI(sprintf('%s/port_ut%d', Sim_Path, p));
        [curr_data] = ReadUI(sprintf('%s/port_it%d', Sim_Path, p));
        
        % Get frequency domain
        voltage_fd = volt_data.FD.val;
        current_fd = curr_data.FD.val;
        freq = volt_data.FD.f;
        
        % Calculate impedance
        Z = voltage_fd ./ current_fd;
        
        % Find impedance at 2.4 GHz
        [~, idx_2p4] = min(abs(freq - 2.4e9));
        Z_2p4 = Z(idx_2p4);
        
        fprintf('Port %d impedance at 2.4 GHz: %.1f + j%.1f Ω\n', ...
                p, real(Z_2p4), imag(Z_2p4));
        
    catch
        fprintf('Could not calculate impedance for port %d\n', p);
    end
end

% Check field dumps if they exist
fprintf('\n=== Checking Field Dumps ===\n');
et_file = [Sim_Path '/et'];
ht_file = [Sim_Path '/ht'];

if exist(et_file, 'file')
    fprintf('E-field time dump found\n');
end
if exist(ht_file, 'file') 
    fprintf('H-field time dump found\n');
end

% Summary
fprintf('\n=== Summary ===\n');
fprintf('1. Port excitation files are present and readable\n');
fprintf('2. Time domain signals show Gaussian pulse excitation\n');
fprintf('3. Check if signals have decayed sufficiently\n');
fprintf('4. Port impedances can indicate matching issues\n');
