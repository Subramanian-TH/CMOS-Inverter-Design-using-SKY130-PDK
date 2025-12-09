# CMOS INVERTER DESIGN USING SKY130-PDK
![License](https://img.shields.io/badge/License-MIT-green)
![PDK](https://img.shields.io/badge/PDK-SKY130-blue)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

---

## 🛠 Tools Used
![Xschem](https://img.shields.io/badge/Schematic-Xschem-red)
![Ngspice](https://img.shields.io/badge/Simulation-Ngspice-orange)
![Magic](https://img.shields.io/badge/Layout-Magic-blue)
![Netgen](https://img.shields.io/badge/LVS-Netgen-green)

| Tool | Purpose |
|------|---------|
| 📐 **Xschem** | Circuit schematic, Symbol creation & SPICE netlist generation |
| ⚙️ **Ngspice** | DC transfer characteristics, noise margin analysis, transient analysis, delay analysis, power analysis |
| 🧱 **Magic** | Layout design & physical verification (DRC) |
| 🔗 **Netgen** | LVS comparison between extracted and schematic netlists |

---

## 🔁 Methodology
1. 📐 **Schematic Design using Xschem**
   - CMOS inverter circuit drawn using SKY130 device models
   - Symbol created and testbench constructed from the schematic
   - SPICE netlist generated for simulation

2. ⚙️ **Circuit Simulation using Ngspice**
   - DC sweep performed to obtain voltage transfer characteristic (VTC)
   - Noise margin calculated from VTC parameters (VIL, VIH, VOL, VOH)
   - Transient switching analysis used to measure propagation delays (tpHL, tpLH)
   - Power analysis performed:
     - Static power from operating point
     - Dynamic power from waveform activity

3. 🧱 **Layout Design using Magic**
   - Layout created using SKY130 design rules
   - DRC executed to ensure no rule violations

4. 🧾 **Extraction**
   - Parasitic extraction performed in Magic to generate the extracted netlist

5. 🔗 **Layout vs Schematic (LVS) Verification using Netgen**
   - Extracted layout netlist compared with schematic netlist
   - LVS matched, confirming correct physical implementation
  
  ---

### 📐 CMOS Inverter Schematic 
| Schematic |
|-----------|
| <img src="https://github.com/user-attachments/assets/221f3f4a-2f0d-42dc-91f1-87c84a7c4491" width="600"> |

### 🔣 CMOS Inverter Symbol 
| Symbol |
|--------|
| <img src="https://github.com/user-attachments/assets/10d1a17c-4a0c-4e56-afc2-e4358b1b3e2c" width="400"> |


### 🧪 Testbench for DC & Transient Simulation
| Testbench |
|-----------|
| <img src="https://github.com/user-attachments/assets/2216c5aa-a571-4fa1-87af-c1524d86eebc" width="600"> |

  ## 📈 Simulation Results
  ### 🔬 DC Transfer Characteristics
###  1. Voltage Transfer Characteristic (VTC)

- The Voltage Transfer Characteristic (VTC) shows the relationship between the output voltage (Vout) and input voltage (Vin).
- It is used to understand how the inverter responds to different input voltage levels.
- VTC is essential for evaluating the switching behavior and performance of the inverter.
- The plot helps identify different operating regions of the CMOS inverter:
  - **Cut-off region**
  - **Transition region**
  - **Saturation region**

| Ngspice Console |  DC characteristic curve |
|----------------------------|-------------------------------|
| <img src="https://github.com/user-attachments/assets/9ba7742a-99bf-4e5d-935b-a0afe79bb6fa" width="600"> | <img src="https://github.com/user-attachments/assets/d9a17162-2060-49b9-b838-445bbe3d776e" width="600"> |

### 2. Noise Margin Analysis 

Noise margin quantifies the ability of a CMOS inverter to tolerate noise without logic errors. It is derived from the DC Transfer Characteristic (VTC) and is determined using critical voltage levels:

- **VOL** = Output LOW level
- **VOH** = Output HIGH level
- **VIH** = voltage input high — the minimum voltage needed at the input to be considered logic HIGH (1)
- **VIL** = voltage input low — the maximum voltage needed at the input to be considered logic LOW (0)

These values are obtained by evaluating the slope of the VTC (gain = |dVout/dVin|).

| Ngspice Console | Gain Plot |
|--------------------|------------------|
| <img src="https://github.com/user-attachments/assets/08f3a081-e327-46ad-a277-e564c46a7d64" width="600"> | <img src="https://github.com/user-attachments/assets/7a69f557-b825-4c1f-a47c-7cd829d62318" width="600"> |

> [!NOTE]
> **Measured Values**
> - VIL  ≈ 0.743 V  
> - VIH ≈ 0.980 V  
> - VOL ≈ ~0 V  
> - VOH ≈ ~1.8 V  
>
> **Noise Margins**
> - NML = VIL − VOL  
> - NMH = VOH − VIH  


---

## ⚡ Transient Analysis
### 1. Delay Analysis 

Propagation delay describes how long the inverter output takes to respond to an input transition.

- **tpHL** → Delay during HIGH → LOW transition (output falling)
- **tpLH** → Delay during LOW → HIGH transition (output rising)
- **tp** → Average propagation delay ( **tp = (tpHL + tpLH) / 2** ) 


Rise and fall times describe how quickly the output transitions between logic levels:

- **tr** → Rise time (LOW → HIGH output transition)
- **tf** → Fall time (HIGH → LOW output transition)

These timing parameters are measured from the transient output waveform using standard percentage definitions:

- **Rise time (tr)** → Time taken for output to go from **10% to 90% of Vout**
- **Fall time (tf)** → Time taken for output to go from **90% to 10% of Vout**
- **Propagation delays**
  - **tpHL** → Input: rising 50% point → Output: falling 50% point  
  - **tpLH** → Input: falling 50% point → Output: rising 50% point

| Delay Measurement Console | Delay Waveform |
|---------------------------|----------------|
| <img src="https://github.com/user-attachments/assets/11671ef0-264f-4ec9-aa45-0704c63dfc5b" width="550"> | <img src="https://github.com/user-attachments/assets/6ddac93b-7720-493e-8451-3f210d65ba59" width="550"> |

> [!NOTE]
> **Propagation Delays**
> - **tpHL = 0.020498 ns**
> - **tpLH = 0.013525 ns**
> - **tp   = 0.017012 ns** (average)
>
> **Rise / Fall Times**
> - **tr = 0.027106 ns**
> - **tf = 0.030939 ns**

---

### 2. 🔋Dynamic Power Analysis
- Dynamic power is consumed only during **output switching**, when the inverter output transitions between HIGH and LOW.
- A load capacitance (CL) is connected at the inverter output node.
- When **VIN is LOW**:
  - PMOS is **ON**, NMOS is **OFF**
  - VOUT is driven to **HIGH (≈ VDD)** and CL is **charged**
- When **VIN is HIGH**:
  - PMOS is **OFF**, NMOS is **ON**
  - VOUT is driven to **LOW (≈ 0 V)** and CL is **discharged**
- Each complete charge–discharge cycle consumes energy:
  - **E = CL × VDD²**
- The average dynamic power is:
  - **Pdyn = CL × VDD² × f**
- Thus, **increasing CL, VDD, or switching frequency f increases dynamic power**, while reducing CL an VDD reduces dynamic power under identical conditions.

| **Power Measurement (Large CL = 0.5 pF)** | **Power Measurement (Small CL = 0.2 pF)** |
|------------------------------------------|-------------------------------------------|
| <img src="https://github.com/user-attachments/assets/15e8987c-4209-4b70-b991-0dee40e68223" width="500"> | <img src="https://github.com/user-attachments/assets/e64e5bf7-11e1-47b7-a753-023ae1e6a913" width="500"> |

<p align="center">
  <b>Dynamic Power Waveform </b><br>
  <img src="https://github.com/user-attachments/assets/eab59e08-1d10-4d40-92ab-dd0041ddca7e" width="800">
</p>

| Load Capacitance | Dynamic Power |
|:---------------:|:-------------:|
| **0.5 pF**       | **81.48 µW**  |
| **0.2 pF**       | **32.87 µW**  |

---

### 🧱 CMOS Inverter Layout

- The inverter was implemented using Magic VLSI with SKY130 technology.  
- Separate PMOS and NMOS transistors were placed in p-well and n-well regions, and metal routing was used to form the output node, VDD and GND connections.

- DRC was performed to ensure layout correctness
- Extraction generated a parasitic-aware netlist

<p align="center">
  <img src="https://github.com/user-attachments/assets/67dc5268-d1cb-4733-ad39-37a0313dc677" width="650">
</p>

## 🔍 Layout vs Schematic (LVS)

- LVS verification was performed using **Netgen** to ensure electrical equivalence between the schematic netlist generated from Xschem and the extracted netlist generated from Magic.

- Extracted netlist obtained after layout parasitic extraction
- Netgen compared device connectivity, node names, and parameters
- All connections matched without mismatches
- **LVS result: Matched ✔️**

Below are the two netlists used for LVS verification:

| Extracted Layout Netlist | Schematic Netlist |
|--------------------------|-------------------|
| <img src="https://github.com/user-attachments/assets/1a07b5c3-6a5c-4da0-ad40-b3236d5776f9" width="500"> | <img src="https://github.com/user-attachments/assets/4a066879-4865-48b5-b0e7-c47a974da686" width="500"> |

<p align="center">
  <img src="https://github.com/user-attachments/assets/d000c80a-7d7e-4862-a835-7cbdda6bd311" width="550">
</p>

---

## 👤 About the Developer

Designed and verified by **Subramanian T H**  
ECE – VLSI Design Enthusiast  

🔗 **LinkedIn:** https://www.linkedin.com/in/subramanian-t-h/











