% Improved patch antenna dimensions for 2.4 GHz
% Run this to calculate better dimensions

% Constants
c0 = 299792458;  % Speed of light
f0 = 2.4e9;      % Design frequency

% Substrate properties (FR4)
er = 4.3;        % Relative permittivity
h = 1.6;         % Height in mm
tan_d = 0.025;   % Loss tangent

% Calculate effective permittivity
W = 30;  % Initial guess for width in mm
er_eff = (er + 1)/2 + (er - 1)/2 * (1 + 12*h/W)^(-0.5);
fprintf('Effective permittivity: %.3f\n', er_eff);

% Calculate patch dimensions
% Length (with fringing effects)
L_eff = c0 / (2 * f0 * sqrt(er_eff));
dL = 0.412 * h * ((er_eff + 0.3) * (W/h + 0.264)) / ((er_eff - 0.258) * (W/h + 0.8));
L = L_eff - 2*dL;
L_mm = L * 1000;

% Width (for good radiation efficiency)
W_mm = c0 / (2 * f0) * sqrt(2/(er + 1)) * 1000;

fprintf('\nOptimized patch dimensions:\n');
fprintf('Width: %.1f mm\n', W_mm);
fprintf('Length: %.1f mm\n', L_mm);

% Feed point calculation (for 50 ohm match)
% Using quarter-wave transformer method
Rin_edge = 90 * (L_mm/W_mm)^2;  % Edge resistance
fprintf('\nEdge resistance: %.1f ohms\n', Rin_edge);

% Find 50 ohm point
y0 = L_mm/2 * sqrt(50/Rin_edge);
fprintf('Feed offset from edge: %.1f mm\n', y0);

% Inset feed dimensions
feed_gap = 0.5;  % Gap on each side of feed
inset_width = 3;  % Width of inset
inset_depth = y0;  % Depth of inset

fprintf('\nInset feed dimensions:\n');
fprintf('Inset width: %.1f mm\n', inset_width);
fprintf('Inset depth: %.1f mm\n', inset_depth);
fprintf('Feed gap: %.1f mm\n', feed_gap);

% Generate updated parameters for main script
fprintf('\n%% Copy these values to your main script:\n');
fprintf('patch.width = %.1f;    %% Width of patch (mm)\n', W_mm);
fprintf('patch.length = %.1f;   %% Length of patch (mm)\n', L_mm);
fprintf('feed.offset = %.1f;     %% Feed point offset from edge\n', y0);
fprintf('feed.width = %.1f;      %% Width of feed line\n', inset_width);

% For inset-fed patch (alternative design)
fprintf('\n%% For inset-fed patch (better matching):\n');
fprintf('inset.width = %.1f;\n', inset_width);
fprintf('inset.depth = %.1f;\n', inset_depth);
fprintf('inset.gap = %.1f;\n', feed_gap);
