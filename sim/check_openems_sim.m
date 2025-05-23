% Check OpenEMS Simulation Results
% Run this after your main simulation to diagnose issues

% Add paths
addpath('/files/tools/openEMS/matlab');
addpath('/files/tools/CSXCAD/matlab');

% Check simulation directory
Sim_Path = 'antenna_array_2x2';

% 1. Check if simulation files exist
fprintf('\n=== Checking Simulation Files ===\n');
if exist(Sim_Path, 'dir')
    fprintf('Simulation directory exists: %s\n', Sim_Path);
    
    % List all files
    files = dir(Sim_Path);
    fprintf('\nFiles in simulation directory:\n');
    for i = 1:length(files)
        if ~files(i).isdir
            fprintf('  %s (%.1f KB)\n', files(i).name, files(i).bytes/1024);
        end
    end
    
    % Check for NF2FF files
    nf2ff_files = dir([Sim_Path '/nf2ff_*.h5']);
    if isempty(nf2ff_files)
        fprintf('\nWARNING: No NF2FF files found! This explains the CalcNF2FF error.\n');
    else
        fprintf('\nFound %d NF2FF files\n', length(nf2ff_files));
    end
    
    % Check for port files
    port_files = dir([Sim_Path '/port_*.h5']);
    fprintf('\nFound %d port files\n', length(port_files));
    
else
    fprintf('ERROR: Simulation directory not found!\n');
end

% 2. Check time domain signals
fprintf('\n=== Checking Port Excitations ===\n');
try
    % Load port 1 data
    [port] = ReadUI('port_ut1', Sim_Path);
    time = port.TD.t;
    voltage = port.TD.val;
    
    figure;
    subplot(2,1,1);
    plot(time*1e9, voltage);
    xlabel('Time (ns)');
    ylabel('Voltage (V)');
    title('Port 1 Time Domain Signal');
    grid on;
    
    % Check if signal has decayed
    final_amplitude = max(abs(voltage(end-1000:end)));
    initial_amplitude = max(abs(voltage));
    decay_ratio = final_amplitude / initial_amplitude;
    
    fprintf('Signal decay ratio: %.2e\n', decay_ratio);
    if decay_ratio > 0.01
        fprintf('WARNING: Signal has not decayed sufficiently! Need more timesteps.\n');
    end
    
    % FFT to check frequency response
    subplot(2,1,2);
    [f, val] = FFT_time2freq(time, voltage);
    plot(f/1e9, 20*log10(abs(val)));
    xlabel('Frequency (GHz)');
    ylabel('Magnitude (dB)');
    title('Frequency Spectrum');
    grid on;
    xlim([1 4]);
    
catch err
    fprintf('Could not read port data: %s\n', err.message);
end

% 3. Visualize the geometry
fprintf('\n=== Geometry Visualization ===\n');
fprintf('Opening geometry viewer...\n');
CSX_file = [Sim_Path '/antenna_array.xml'];
if exist(CSX_file, 'file')
    try
        CSXGeomPlot(CSX_file);
    catch
        fprintf('Could not open geometry viewer\n');
    end
else
    fprintf('Geometry file not found\n');
end

% 4. Suggested fixes
fprintf('\n=== Suggested Fixes ===\n');
fprintf('1. Increase simulation time:\n');
fprintf('   FDTD = SetNumberOfTimesteps(FDTD, 200000);\n\n');

fprintf('2. Adjust NF2FF box margins:\n');
fprintf('   nf2ff_margin = 30; %% Increase from 15\n\n');

fprintf('3. Check mesh resolution around patches:\n');
fprintf('   Add more mesh lines around critical features\n\n');

fprintf('4. Verify feed design:\n');
fprintf('   The poor S-parameters suggest feed mismatch\n');
fprintf('   Consider adjusting feed_offset or patch dimensions\n\n');

% 5. Quick patch dimension calculator
fprintf('=== Patch Dimension Check ===\n');
c0 = 299792458;
f0 = 2.4e9;
er = 4.3;
h = 1.6e-3;

% Effective permittivity
er_eff = (er + 1)/2 + (er - 1)/2 * (1 + 12*h/(30e-3))^(-0.5);
fprintf('Effective permittivity: %.2f\n', er_eff);

% Patch length calculation
L = c0 / (2 * f0 * sqrt(er_eff)) * 1000; % in mm
fprintf('Theoretical patch length: %.1f mm (currently using 28 mm)\n', L);

% Patch width calculation  
W = c0 / (2 * f0) * sqrt(2/(er + 1)) * 1000; % in mm
fprintf('Theoretical patch width: %.1f mm (currently using 30 mm)\n', W);
