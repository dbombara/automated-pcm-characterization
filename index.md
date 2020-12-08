---
---

## Welcome

The developed MATLAB application can be utilized to automatically tune and characterize phase-changing optical filters. The tuning is enabled by a pulsed laser, function generator, and oscilloscope that are automatically controlled through MATLAB. A bandpass ***linear variable filter*** (LVF) and ***infrared (IR) camera*** enable the characterization.The linear variable filter (LVF) enables ***compact, low-cost, and in situ measurement*** of the tunable filter's bandpass ***center wavelength***. The IR camera additionally enables measurement of the tunable filter's ***transmittance intensity***.

<div id = "viewerContainer">
</div>

## Getting started

### Software and Packages

1. Download and install [MATLAB](https://www.mathworks.com/downloads/).

2. Install the following toolboxes: [Control Systems Toolbox](https://www.mathworks.com/products/control.html), [Image Processing Toolbox](https://www.mathworks.com/products/image.html), [Instrument Control Toolbox](https://www.mathworks.com/products/instrument.html).

3. Download and install the [FLIR File Reader SDK for MATLAB](https://www.flir.com/discover/rd-science/matlab/).

4. Download and install the LVF characterization MATLAB GUI by clicking lvf_characterization.mlappinstall. 

### Instrument Drivers
The required instrument drivers will vary depending on your instrument's manufacturer and model. Any oscilloscope and function generator that utilizes an underlying IVI-C driver can be utilized with the developed GUI. Below are instructions for utilizing a Tekronix DPO-, MDO-, or MSO-class oscilloscope.

1. Download and install [TekVISA](https://www.tek.com/oscilloscope/tds7054-software/tekvisa-connectivity-software-v411). 
2. Download and install the [DPO2000, DPO3000, DPO4000 IVI Driver](https://www.tek.com/oscilloscope/dpo4054-software/dpo2000-dpo3000-dpo4000-ivi-driver).

### Hardware
Oscilloscope and Function Generator

Linear Variable Filter

Infrared Camera:

* For mid-wave infrared (MWIR): FLIR SC8000 Series

* For short-wave infrared (SWIR): FLIR A6261

* Low-cost option: Rapsberry Pi Model B + Raspberry Pi NoIR Camera

## GUI Overview

### Publication
