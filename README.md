# Model Predictive Control - Porsche Taycan Speed Control

[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=simorxb/taycan-MPC)

## Summary
This project explores the implementation of a Model Predictive Control (MPC) algorithm for the speed control of a Porsche Taycan. The model simulates the vehicle's dynamics, integrates actuator behavior, and demonstrates the smooth performance of the MPC controller. The repository includes MATLAB code and Simulink models to replicate the results and experiment further.

## Project Overview
The focus of this project is to utilize MPC for controlling the speed of a Porsche Taycan, a high-performance electric vehicle. The Taycan is modeled as a dynamic system where the applied force, aerodynamic drag, and other factors determine its behavior. The MPC algorithm is implemented in Simulink using a nonlinear MPC object.

### Plant Model
The Taycan's dynamics are modeled using the equation:

$$
m \cdot \frac{dv}{dt} = F - b \cdot v^2
$$

Where:
- $m$: Mass of the car (2140 kg)
- $b$: $0.5 \cdot C_d \cdot A \cdot \rho$ (drag factor, 0.331)
- $v$: Vehicle speed
- $F$: Applied force

The values for the Porsche Taycan include:
- $C_d \cdot A = 0.513 \, \text{m}^2$
- $v_{\text{max}} = 72 \, \text{m/s} \, (260 \, \text{km/h})$
- $F_{\text{max}(0)} = 22000 \, \text{N}$ (estimated for 0–100 km/h in 3.2 s)
- $F_{\text{max}(72)} = 1710 \, \text{N}$

The maximum force decreases linearly with speed, modeled using a lookup table in MATLAB.

### MPC Implementation
- **MATLAB Function**: A custom MATLAB function `stateFcnTaycan` defines the nonlinear dynamics.
- **MPC Block**: A nonlinear MPC (nlmpc) object initialized in MATLAB governs the control logic.
- **Simulation Setup**: A repeating sequence block in Simulink generates speed references to evaluate controller performance.

### Tuning Parameters
- Output variable weight: 1
- Manipulated variable weight: 0
- Manipulated variable rate of change weight: 0.002

### Results
The simulation demonstrates that the MPC algorithm achieves smooth control with minimal overshoot. The robustness of the approach will be tested further in subsequent iterations.

## Author
This project is developed by Simone Bertoni. Learn more about my work on my personal website - [Simone Bertoni - Control Lab](https://simonebertonilab.com/).

## Contact
For further communication, connect with me on [LinkedIn](https://www.linkedin.com/in/simone-bertoni-control-eng/).

## Resources
- Explore the code and models: [taycan-MPC GitHub Repository](https://github.com/simorxb/taycan-MPC)

