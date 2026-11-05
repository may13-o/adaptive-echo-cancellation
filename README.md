# Adaptive Echo Cancellation for Voice Communication Using MATLAB & Simulink

## Overview

Echo is a common problem in voice communication systems. It occurs when audio played through a speaker is picked up again by a microphone and transmitted back to the original speaker, creating an annoying delayed repetition of their voice.

This project aims to simulate and implement an **Adaptive Echo Cancellation (AEC)** system using MATLAB and Simulink. It uses an adaptive digital filter to estimate the echo component in a microphone signal and subtract it to obtain a cleaner voice signal.

## Problem Statement

In hands-free communication systems, the far-end speaker's audio can travel through the acoustic environment and enter the near-end microphone. This creates acoustic echo, which reduces communication quality.

The objective is to design a system that:
- Simulates an acoustic echo path.
- Generates a microphone signal containing echo, near-end speech and background noise.
- Uses an adaptive filter to estimate the echo path.
- Removes the estimated echo while preserving the near-end speech.

## Objectives

- Understand acoustic echo in voice communication systems.
- Generate and analyze far-end and near-end audio signals.
- Model an acoustic environment using MATLAB.
- Implement an adaptive filtering algorithm in Simulink.
- Evaluate echo cancellation performance using signal analysis.
- Visualize input and output waveforms.

## System Architecture

```text
       Far-End Reference Signal
                 |
                 v
          Acoustic Echo Path
                 |
                 v
             Echo Signal
                 |
                 +------------------+
                                    |
Near-End Speech + Background Noise |
                 |                  |
                 v                  v
          Microphone Signal --> Adaptive Echo Canceller
                                    |
                                    v
                             Echo Estimation
                                    |
                                    v
                           Echo Subtraction
                                    |
                                    v
                         Cleaned Output Signal
```

## Tools and Technologies

| Component | Technology |
|---|---|
| Programming Environment | MATLAB |
| Simulation Platform | Simulink |
| Signal Processing | Digital Signal Processing |
| Adaptive Filtering | NLMS (Normalized Least Mean Squares) |
| Sampling Frequency | 8000 Hz |
| Simulation Duration | 5 seconds |
| Adaptive Filter | FIR-based adaptive filter |

## Signal Generation

The simulation generates three important signals:

1. **Far-End Reference Signal:** Represents the audio transmitted by the remote speaker.
2. **Echo Signal:** Represents the delayed and attenuated version of the far-end signal after passing through a simulated acoustic path.
3. **Microphone Signal:** Contains the echo signal, near-end speech and background noise.

The simulated microphone signal is:

\[
d(n)=e(n)+s(n)+v(n)
\]

Where:

- \(d(n)\) = Microphone signal
- \(e(n)\) = Echo signal
- \(s(n)\) = Near-end speech
- \(v(n)\) = Background noise

## Adaptive Echo Cancellation

The adaptive filter estimates the echo using the far-end reference signal.

The estimated echo is subtracted from the microphone signal:

\[
y(n)=d(n)-\hat{e}(n)
\]

Where:

- \(y(n)\) = Error or cleaned output signal
- \(d(n)\) = Microphone signal
- \(\hat{e}(n)\) = Estimated echo

The NLMS algorithm continuously adjusts its filter coefficients to minimize the error between the actual microphone signal and the estimated echo.

## Simulation Parameters

| Parameter | Value |
|---|---:|
| Sampling Frequency | 8000 Hz |
| Simulation Duration | 5 seconds |
| Number of Samples | 40001 |
| Echo Path Length | 256 taps |
| Adaptive Algorithm | NLMS |
| Background Noise | Gaussian noise |

## Project Structure

```text
adaptive-echo-cancellation/
│
├── MATLAB/
│   └── echo_setup.m
