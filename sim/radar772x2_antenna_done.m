%% 77 GHz 2x2 Radar Array - TUNING FOR 76-81 GHz BAND (Corrected SetGaussExcite)
close all
clear
clc

%% Setup the physical constants and antenna parameters
physical_constants; 
unit = 1e-3; 

% Original center frequency (for reference if needed)
f0_initial = 77e9; 
% Target design center frequency for the FMCW band
f_design = 78.5e9; % Mid-point of 76-81 GHz
% Bandwidth of Gaussian pulse
fc_pulse = (81e9 - 76e9) * 1.5; % Pulse bandwidth to cover a bit more than the operating band

% Calculate wavelength at new design frequency
c0_actual = C0;
lambda0_design_meters = c0_actual / f_design;
lambda0_design = lambda0_design_meters / unit; 
fprintf('Wavelength at new design freq %.2f GHz: %.3f mm\n', f_design/1e9, lambda0_design);

% substrate setup
substrate.epsR = 3.0; 
lambda_g_design_meters = lambda0_design_meters / sqrt(substrate.epsR);
lambda_g_design = lambda_g_design_meters / unit; 
fprintf('Guided wavelength at %.2f GHz: %.3f mm\n', f_design/1e9, lambda_g_design);

% --- Patch Dimension Adjustment ---
lambda0_at_77GHz = (c0_actual / 77e9) / unit;
lambda_g_at_77GHz = lambda0_at_77GHz / sqrt(substrate.epsR);
prev_patch_length_val = 0.49 * lambda_g_at_77GHz * 0.9; 
fprintf('Previous patch length (for ~74.42 GHz): %.4f mm\n', prev_patch_length_val);

f_current_resonance = 74.42e9; 
f_target_resonance = f_design; 
length_scaling_factor = f_current_resonance / f_target_resonance;
new_target_patch_length = prev_patch_length_val * length_scaling_factor;
fprintf('Target new patch length for %.2f GHz: %.4f mm\n', f_target_resonance/1e9, new_target_patch_length);

patch.length = new_target_patch_length; 
patch.width  = 0.49 * lambda_g_design; 
fprintf('New patch dimensions: L=%.3f mm x W=%.3f mm\n', patch.length, patch.width);
% --- End Patch Dimension Adjustment ---

substrate.kappa  = 0.0027; 
substrate.width  = 20; 
substrate.length = 20; 
substrate.thickness = 0.127; 
substrate.cells = 3; 

% setup feeding
feed.pos = 0; 
feed.width = 0.1; 
feed.R = 50; 

% array parameters - adjust spacing to new design wavelength
array.dx = 0.5 * lambda0_design;
array.dy = 0.5 * lambda0_design;
array.nx = 2;
array.ny = 2;
fprintf('New array spacing dx=dy=%.3f mm\n', array.dx);

% size of the simulation box
SimBox = [30 30 10]; 

%% Setup FDTD parameters
FDTD = InitFDTD('NrTS', 80000, 'EndCriteria', 1e-4); 
FDTD = SetGaussExcite(FDTD, f_design, fc_pulse); % CORRECTED: Removed 4th argument
BC = {'MUR' 'MUR' 'MUR' 'MUR' 'MUR' 'MUR'};
FDTD = SetBoundaryCond(FDTD, BC);

%% Setup the CSXCAD mesh
CSX = InitCSX();

lambda_min_op_band_meters = c0_actual / 81e9; 
lambda_min_op_band_mm = lambda_min_op_band_meters / unit;
% For meshing, consider the guided wavelength at the highest frequency of the op band
max_res_wv_guided_min = (lambda_min_op_band_mm / sqrt(substrate.epsR)) / 15; 

N_cells_per_feed = 1.5; 
max_res_feed = feed.width / N_cells_per_feed;
if substrate.cells > 1
    max_res_sub = substrate.thickness / (substrate.cells-1);
else
    max_res_sub = substrate.thickness; 
end
max_res = min([max_res_wv_guided_min, max_res_feed, max_res_sub]);
fprintf('Max mesh resolution: %.4f mm (wv_g_min/15: %.4f, feed: %.4f, sub: %.4f)\n', max_res, max_res_wv_guided_min, max_res_feed, max_res_sub);

mesh.x = [-SimBox(1)/2, SimBox(1)/2, -substrate.width/2, substrate.width/2];
mesh.y = [-SimBox(2)/2, SimBox(2)/2, -substrate.length/2, substrate.length/2];

pcx = zeros(1, array.nx);
pcy = zeros(1, array.ny);
for ix_idx = 1:array.nx; pcx(ix_idx) = (ix_idx - (array.nx+1)/2) * array.dx; end
for iy_idx = 1:array.ny; pcy(iy_idx) = (iy_idx - (array.ny+1)/2) * array.dy; end

for ix_idx = 1:array.nx
    for iy_idx = 1:array.ny
        cx = pcx(ix_idx); cy = pcy(iy_idx);
        mesh.x = [mesh.x, cx-patch.width/2, cx+patch.width/2];
        mesh.y = [mesh.y, cy-patch.length/2, cy+patch.length/2];
    end
end

feed_w = feed.width;
y_j1 = 0; 
mesh.x = [mesh.x, feed.pos - feed_w/2, feed.pos + feed_w/2];
mesh.y = [mesh.y, y_j1 - feed_w/2, y_j1 + feed_w/2];
mesh.x = [mesh.x, pcx(1)-feed_w/2, pcx(1)+feed_w/2, pcx(array.nx)-feed_w/2, pcx(array.nx)+feed_w/2];

port_y_location = -substrate.length/2; 
port_mesh_margin = feed.width * 1.5; 
mesh.y = [mesh.y, port_y_location - port_mesh_margin, port_y_location, port_y_location + port_mesh_margin];

mesh.x = SmoothMeshLines(unique(sort(mesh.x)), max_res, 1.4); 
mesh.y = SmoothMeshLines(unique(sort(mesh.y)), max_res, 1.4);
mesh.z_fixed_lines = [-SimBox(3)/2, 0, substrate.thickness, SimBox(3)/2];
if substrate.cells > 1 
    mesh.z_fixed_lines = [mesh.z_fixed_lines, linspace(0, substrate.thickness, substrate.cells)];
end
mesh.z = SmoothMeshLines(unique(sort(mesh.z_fixed_lines)), max_res, 1.4);

CSX = DefineRectGrid(CSX, unit, mesh);
fprintf('Mesh cells: %d x %d x %d\n', length(mesh.x)-1, length(mesh.y)-1, length(mesh.z)-1);
fprintf('Total mesh cells: %d\n', (length(mesh.x)-1)*(length(mesh.y)-1)*(length(mesh.z)-1));

%% Create geometry 
CSX = AddMetal(CSX, 'patch'); 
for ix_idx = 1:array.nx
    for iy_idx = 1:array.ny
        cx = pcx(ix_idx); cy = pcy(iy_idx);
        CSX = AddBox(CSX, 'patch', 10, [cx-patch.width/2, cy-patch.length/2, substrate.thickness], [cx+patch.width/2, cy+patch.length/2, substrate.thickness]);
    end
end
fprintf('Added %d patches\n', array.nx*array.ny);

CSX = AddMaterial(CSX, 'substrate'); 
CSX = SetMaterialProperty(CSX, 'substrate', 'Epsilon', substrate.epsR, 'Kappa', substrate.kappa);
CSX = AddBox(CSX, 'substrate', 0, [-substrate.width/2, -substrate.length/2, 0], [substrate.width/2, substrate.length/2, substrate.thickness]);
fprintf('Added substrate\n');

CSX = AddMetal(CSX, 'gnd'); 
CSX = AddBox(CSX, 'gnd', 10, [-substrate.width/2, -substrate.length/2, 0], [substrate.width/2, substrate.length/2, 0]);
fprintf('Added ground plane\n');

CSX = AddMetal(CSX, 'feed_line'); 
fprintf('Adding feed network...\n');
y_feed_bottom_patches = pcy(1) + patch.length/2; 
y_feed_top_patches    = pcy(array.ny) - patch.length/2; 

CSX = AddBox(CSX, 'feed_line', 10, [feed.pos - feed_w/2, -substrate.length/2, substrate.thickness], [feed.pos + feed_w/2, y_j1, substrate.thickness]);
CSX = AddBox(CSX, 'feed_line', 10, [pcx(1), y_j1 - feed_w/2, substrate.thickness], [pcx(array.nx), y_j1 + feed_w/2, substrate.thickness]);
CSX = AddBox(CSX, 'feed_line', 10, [pcx(1) - feed_w/2, y_feed_bottom_patches, substrate.thickness], [pcx(1) + feed_w/2, y_feed_top_patches, substrate.thickness]);
CSX = AddBox(CSX, 'feed_line', 10, [pcx(array.nx) - feed_w/2, y_feed_bottom_patches, substrate.thickness], [pcx(array.nx) + feed_w/2, y_feed_top_patches, substrate.thickness]);
fprintf('  Feed network added.\n');

port_y_center = -substrate.length/2;
port_length_y = feed.width * 2;
start_port = [feed.pos - feed.width/2, port_y_center - port_length_y/2, 0];
stop_port  = [feed.pos + feed.width/2, port_y_center + port_length_y/2, substrate.thickness];
[CSX, port] = AddLumpedPort(CSX, 5, 1, feed.R, start_port, stop_port, [0 0 1], true); 
fprintf('Added lumped port at y approx %.3f, x=[%.3f, %.3f], z=[0, %.3f]\n', port_y_center, start_port(1), stop_port(1), substrate.thickness);

%% Add a nf2ff box
nf2ff_margin = lambda0_design / 2; 
nf2ff_start = [min(pcx)-patch.width/2-nf2ff_margin, min(pcy)-patch.length/2-nf2ff_margin, -nf2ff_margin];
nf2ff_stop  = [max(pcx)+patch.width/2+nf2ff_margin, max(pcy)+patch.length/2+nf2ff_margin, substrate.thickness+nf2ff_margin];
mur_spacing = max_res * 4; 
nf2ff_start(1) = max(nf2ff_start(1), -SimBox(1)/2 + mur_spacing);
nf2ff_start(2) = max(nf2ff_start(2), -SimBox(2)/2 + mur_spacing);
nf2ff_start(3) = max(nf2ff_start(3), -SimBox(3)/2 + mur_spacing);
nf2ff_stop(1)  = min(nf2ff_stop(1), SimBox(1)/2 - mur_spacing);
nf2ff_stop(2)  = min(nf2ff_stop(2), SimBox(2)/2 - mur_spacing);
nf2ff_stop(3)  = min(nf2ff_stop(3), SimBox(3)/2 - mur_spacing);
[CSX, nf2ff] = CreateNF2FFBox(CSX, 'nf2ff', nf2ff_start, nf2ff_stop, 'AddLinestoMesh', 1);
fprintf('Added NF2FF box with AddLinestoMesh=1.\n');

%% Prepare simulation folder
Sim_Path = 'Radar_77GHz_TunedRun1';
Sim_CSX = 'radar_array_tuned1.xml';
if exist(Sim_Path, 'dir'); try rmdir(Sim_Path, 's'); fprintf('Cleared previous directory: %s\n', Sim_Path); catch ME; warning('Could not remove %s: %s', Sim_Path, ME.message); end; end;
mkdir(Sim_Path); fprintf('Created simulation folder: %s\n', Sim_Path);

%% Write openEMS compatible xml-file
WriteOpenEMS([Sim_Path '/' Sim_CSX], FDTD, CSX);

%% Show the structure
CSXGeomPlot([Sim_Path '/' Sim_CSX]);
disp('Check geometry (patch sizes, array spacing may have changed). Press Enter to continue.');
pause;

%% Run openEMS
fprintf('\n*** Starting Tuned Simulation Run 1 ***\n');
RunOpenEMS(Sim_Path, Sim_CSX);

%% Postprocessing
fprintf('\n*** Post-processing results for Tuned Run 1 ***\n');
freq_post = linspace(75e9, 82e9, 141); 
port = calcPort(port, Sim_Path, freq_post);

if ~(isfield(port, 'uf') && isfield(port.uf, 'ref') && isfield(port.uf, 'inc') && ...
     isfield(port, 'if') && isfield(port.if, 'tot'))
    fprintf('ERROR: Port data is incomplete. Skipping S-parameter and impedance plots.\n');
else
    Zin = port.uf.tot ./ port.if.tot;
    s11 = port.uf.ref ./ port.uf.inc;
    P_accepted_freq = 0.5 * real(port.uf.tot .* conj(port.if.tot));

    figure; plot(freq_post/1e9, real(Zin), 'k-', freq_post/1e9, imag(Zin), 'r--', 'Linewidth', 2);
    grid on; title('Feed Point Impedance (Tuned)'); xlabel('Frequency (GHz)'); ylabel('Z_{in} (Ω)'); legend('Re(Zin)','Im(Zin)'); ylim([-200 200]);
    xline(76, '--g', '76 GHz'); xline(81, '--g', '81 GHz');

    figure; plot(freq_post/1e9, 20*log10(abs(s11)), 'k-', 'Linewidth', 2);
    grid on; title('Reflection Coefficient S_{11} (Tuned)'); xlabel('Frequency (GHz)'); ylabel('|S_{11}| (dB)'); ylim([-40 0]);
    yline(-10, '--r', 'S11=-10dB'); xline(76, '--g', '76 GHz'); xline(81, '--g', '81 GHz');

    idx_band = find(freq_post >= 76e9 & freq_post <= 81e9);
    if ~isempty(idx_band)
        s11_in_band = s11(idx_band);
        freq_in_band = freq_post(idx_band);
        [max_s11_in_band_abs, idx_max_s11_in_band] = max(abs(s11_in_band));
        max_s11_in_band_dB = 20*log10(max_s11_in_band_abs);
        fprintf('\nWithin 76-81 GHz band:\n');
        fprintf('Max S11 value: %.2f dB at %.2f GHz\n', max_s11_in_band_dB, freq_in_band(idx_max_s11_in_band)/1e9);
    else
        fprintf('\nNo frequency points found within the 76-81 GHz band for S11 analysis.\n');
    end

    [min_s11_val, f_res_idx_global] = min(abs(s11));
    f_res_for_ff = freq_post(f_res_idx_global);
    P_accepted_at_f_res_for_ff = P_accepted_freq(f_res_idx_global);

    if f_res_for_ff < 76e9 || f_res_for_ff > 81e9 || 20*log10(min_s11_val) > -10
        fprintf('Global resonance (%.2f GHz, S11=%.1fdB) is outside 76-81GHz band or poorly matched. Using band center (%.2fGHz) for far-field.\n', f_res_for_ff/1e9, 20*log10(min_s11_val), f_design/1e9);
        f_res_for_ff = f_design;
        [~, f_res_idx_band_center] = min(abs(freq_post - f_design));
         if ~isempty(f_res_idx_band_center) && f_res_idx_band_center <= length(P_accepted_freq)
            P_accepted_at_f_res_for_ff = P_accepted_freq(f_res_idx_band_center);
        else
            P_accepted_at_f_res_for_ff = 0; % Fallback
            fprintf('Warning: Could not find band center in freq_post for P_accepted.\n');
        end
    end
        
    fprintf('\nResonance frequency (min S11 global): %.2f GHz, S11: %.1f dB\n', freq_post(f_res_idx_global)/1e9, 20*log10(min_s11_val));
    fprintf('Using %.2f GHz for far-field calculation.\n', f_res_for_ff/1e9);
    fprintf('Accepted power at this frequency: %.3e W\n', P_accepted_at_f_res_for_ff);
    drawnow;

    fprintf('\nCalculating far field at %.2f GHz...\n', f_res_for_ff/1e9);
    nf2ff = CalcNF2FF(nf2ff, Sim_Path, f_res_for_ff, (-180:2:180)*pi/180, [0 90]*pi/180, 'Verbose',1);

    if isfield(nf2ff, 'Prad') && nf2ff.Prad > 1e-35 && P_accepted_at_f_res_for_ff > 1e-35 % Adjusted threshold for very low powers
        fprintf('\nAntenna Performance at %.2f GHz:\n', f_res_for_ff/1e9);
        fprintf('Radiated power: Prad = %.3e W\n', nf2ff.Prad);
        fprintf('Directivity: Dmax = %.2f (%.2f dBi)\n', nf2ff.Dmax, 10*log10(nf2ff.Dmax));
        
        RadEff = nf2ff.Prad / P_accepted_at_f_res_for_ff;
        Gain = nf2ff.Dmax * RadEff;
        fprintf('Radiation Efficiency (Prad / P_accepted_at_f_res_for_ff): %.2f %%\n', RadEff*100);
        fprintf('Gain: %.2f (%.2f dBi)\n', Gain, 10*log10(Gain));
        
        figure; polarFF(nf2ff, 'xaxis', 'theta', 'param', [1 2], 'normalize', 1, 'logscale', -25);
        title(sprintf('Normalized Pattern at %.2f GHz (Tuned)', f_res_for_ff/1e9));
        figure; plotFFdB(nf2ff, 'xaxis', 'theta', 'param', [1 2]);
        title(sprintf('Radiation Pattern (dBi) at %.2f GHz (Tuned)', f_res_for_ff/1e9));
        
        fprintf('\nCalculating 3D far field pattern at %.2f GHz...\n', f_res_for_ff/1e9);
        thetaRange = (0:5:180); phiRange = (-180:5:180);
        nf2ff_3D = CalcNF2FF(nf2ff, Sim_Path, f_res_for_ff, thetaRange*pi/180, phiRange*pi/180, 'Verbose', 0, 'Outfile', '3D_Pattern.h5');
        if isfield(nf2ff_3D, 'E_norm') && ~isempty(nf2ff_3D.E_norm{1}) && max(nf2ff_3D.E_norm{1}(:)) > 1e-15 % Adjusted threshold
            figure; plotFF3D(nf2ff_3D, 'logscale', -25); 
            title(sprintf('3D Pattern (dBi) at %.2f GHz (Tuned)', f_res_for_ff/1e9));
        else
            fprintf('Error: 3D far field E_norm is empty or too small. Skipping 3D plot.\n');
        end
    else
        fprintf('Error: No significant radiated power or accepted power for far-field plots.\n');
        if isfield(nf2ff,'Prad'); fprintf('Prad = %.2e W\n', nf2ff.Prad); end
        fprintf('P_accepted_at_f_res_for_ff = %.2e W\n', P_accepted_at_f_res_for_ff);
    end
end

fprintf('\n*** Simulation Complete! ***\n');
fprintf('Results saved in: %s\n', Sim_Path);