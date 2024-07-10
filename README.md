# Signal-Detection-and-Classification-A-Deep-Learning-Matlab-Approach
 
## Overview

This project focuses on the classification of different types of wireless signals, including LTE, 5G, and Wi-Fi, and their combinations. The aim is to develop a model that can accurately classify seven types of signals: individual LTE, 5G, and Wi-Fi signals, as well as their double and triple mixtures.

## Project Structure

- `data/`: Directory containing the waveform data files.
  - `LTE_Waveforms/`
  - `5G_Waveforms/`
  - `WiFi_Waveforms/`
- `Display/`: Directory containing the Python scripts for data processing and model training.
- `matlab/`: Directory containing MATLAB scripts for data generation.

## Data Generation

The waveform data for LTE, 5G, and Wi-Fi signals were generated using MATLAB. Here is a brief overview of the steps involved in data generation:

### MATLAB Scripts

- We used MATLAB to generate waveforms for LTE, 5G, and Wi-Fi signals based on their respective protocols and configurations.
- The waveforms were saved as `.mat` files in the `data/` directory.

### Configuration Parameters

- **For LTE**: Various reference channels, subframe numbers, modulation schemes, transmission bandwidths, and duplex modes were used.
- **For 5G**: Different frequency ranges, subcarrier spacings, modulation schemes, channel bandwidths, and duplex modes were considered.
- **For Wi-Fi**: Channel coding schemes, modulation schemes, guard intervals, and channel bandwidths were used.
"""
