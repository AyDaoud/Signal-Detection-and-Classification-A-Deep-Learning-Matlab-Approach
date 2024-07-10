% Filename: wifi_waveform_generation.m

% Initialize parameters
ChannelCoding = {'BCC', 'LDPC'};
ModulationSchemes = {'BPSK', 'QPSK', '16QAM', '64QAM', '256QAM'};
GuardInterval = {'Short', 'Long'};
ChannelBandwidths = [20, 40, 80, 160]; % in MHz

% Create a directory to save waveforms if it doesn't exist
outputDir = 'WiFi_Waveforms';
if ~exist(outputDir, 'dir')
    mkdir(outputDir);
end
plotCounter = 0;
% Wi-Fi Waveform Generation
for i = 1:length(ChannelCoding)
    for j = 1:length(ModulationSchemes)
        for k = 1:length(GuardInterval)
            for l = 1:length(ChannelBandwidths)
                % Create configuration structure for the current setup
                cfg = struct();
                cfg.ChannelCoding = ChannelCoding{i};
                cfg.Modulation = ModulationSchemes{j};
                cfg.GuardInterval = GuardInterval{k};
                cfg.ChannelBandwidth = ChannelBandwidths(l);
                
                % Display configuration
                disp(['Generating Wi-Fi waveform for configuration: ' ...
                    'ChannelCoding=' cfg.ChannelCoding ', ' ...
                    'Modulation=' cfg.Modulation ', ' ...
                    'GuardInterval=' cfg.GuardInterval ', ' ...
                    'ChannelBandwidth=' num2str(cfg.ChannelBandwidth) ' MHz']);
                
                % Generate Wi-Fi waveform (placeholder code)
                waveform = randn(cfg.ChannelBandwidth * 1000, 1); % Replace with actual waveform generation code
                
                % Create a unique filename based on the configuration
                filename = sprintf('Waveform_%s_%s_%s_%dMHz.mat', ...
                    cfg.ChannelCoding, cfg.Modulation, cfg.GuardInterval, ...
                    cfg.ChannelBandwidth);
                filepath = fullfile(outputDir, filename);
                
                % Save the waveform to a .mat file
                save(filepath, 'waveform', 'cfg');
                
                % Plot one of the generated waveforms (for the first iteration)
                if plotCounter < 5
                    plotCounter = plotCounter + 1;
                    figure;
                    plot(waveform);
                    title(['Wi-Fi Waveform: ' cfg.ChannelCoding ', ' ...
                        cfg.Modulation ', ' cfg.GuardInterval ', ' ...
                        num2str(cfg.ChannelBandwidth) ' MHz']);
                    xlabel('Sample Index');
                    ylabel('Amplitude');
                end
            end
        end
    end
end

disp('Wi-Fi waveform generation completed and saved.');
