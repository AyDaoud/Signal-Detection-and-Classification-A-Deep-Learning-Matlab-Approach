% Filename: 5g_waveform_generation.m

% Initialize parameters
FrequencyRanges = {'450MHz-6GHz', '24.25GHz-52.6GHz'};
SubcarrierSpacing = [15, 30, 60]; % in kHz
ModulationSchemes = {'QPSK', '64QAM', '256QAM'};
ChannelBandwidths = [5, 10, 15, 20, 25, 30, 40, 50]; % in MHz
DuplexModes = {'FDD', 'TDD'};

% Create a directory to save waveforms if it doesn't exist
outputDir = '5G_Waveforms';
if ~exist(outputDir, 'dir')
    mkdir(outputDir);
end

% 5G Waveform Generation
for i = 1:length(FrequencyRanges)
    for j = 1:length(SubcarrierSpacing)
        for k = 1:length(ModulationSchemes)
            for l = 1:length(ChannelBandwidths)
                for m = 1:length(DuplexModes)
                    % Create configuration structure for the current setup
                    cfg = struct();
                    cfg.FrequencyRange = FrequencyRanges{i};
                    cfg.SubcarrierSpacing = SubcarrierSpacing(j);
                    cfg.Modulation = ModulationSchemes{k};
                    cfg.ChannelBandwidth = ChannelBandwidths(l);
                    cfg.DuplexMode = DuplexModes{m};
                    
                    % Display configuration
                    disp(['Generating 5G waveform for configuration: ' ...
                        'FrequencyRange=' cfg.FrequencyRange ', ' ...
                        'SubcarrierSpacing=' num2str(cfg.SubcarrierSpacing) 'kHz, ' ...
                        'Modulation=' cfg.Modulation ', ' ...
                        'ChannelBandwidth=' num2str(cfg.ChannelBandwidth) ' MHz, ' ...
                        'DuplexMode=' cfg.DuplexMode]);
                    
                    % Generate 5G waveform (placeholder code)
                    waveform = randn(cfg.ChannelBandwidth * 1000, 1); % Replace with actual waveform generation code
                    
                    % Create a unique filename based on the configuration
                    filename = sprintf('Waveform_%s_%dkHz_%s_%dMHz_%s.mat', ...
                        cfg.FrequencyRange, cfg.SubcarrierSpacing, cfg.Modulation, ...
                        cfg.ChannelBandwidth, cfg.DuplexMode);
                    filepath = fullfile(outputDir, filename);
                    
                    % Save the waveform to a .mat file
                    save(filepath, 'waveform', 'cfg'); 
                    
                    % Plot one of the generated waveforms (for the first iteration)
                    if i == 1 && j == 1 && k == 1 && l == 1 && m == 1
                        figure;
                        plot(waveform);
                        title(['5G Waveform: ' cfg.FrequencyRange ', ' ...
                            num2str(cfg.SubcarrierSpacing) 'kHz, ' ...
                            cfg.Modulation ', ' num2str(cfg.ChannelBandwidth) 'MHz, ' ...
                            cfg.DuplexMode]);
                        xlabel('Sample Index');
                        ylabel('Amplitude'); 
                    end
                end
            end
        end
    end
end

disp('5G waveform generation completed and saved.');
