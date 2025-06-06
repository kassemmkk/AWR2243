% Quick geometry viewer
addpath('/files/tools/openEMS/matlab');
addpath('/files/tools/CSXCAD/matlab');

% View the geometry
CSXGeomPlot('3x3_array/array.xml');

% After simulation, quick check of results
if exist('3x3_array/port_ut1', 'file')
    % Read time signal
    [port] = ReadUI('port_ut1', '3x3_array');
    
    % Simple plot
    figure;
    plot(port.TD.t*1e9, port.TD.val);
    xlabel('Time (ns)'); ylabel('Voltage (V)');
    title('Port Excitation Signal');
    grid on;
end
