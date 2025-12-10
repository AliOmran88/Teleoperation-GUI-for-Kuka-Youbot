# Teleoperation of KUKA YouBot in CoppeliaSim using MATLAB App Designer

## 📌 Overview
This project implements a custom **MATLAB GUI (App Designer)** for the **teleoperation of the KUKA YouBot** inside the **CoppeliaSim robotic simulation environment**.  

The interface provides intuitive controls for robot motion, arm manipulation, and camera feed capture — offering an accessible platform for teleoperated robotics experimentation and educational use.

---

## 🎯 Features

### 🔧 **1. Full Robot Teleoperation**
- Real-time control of:
  - **YouBot wheels** (omnidirectional movement)
  - **Arm joints** (1–5 DOF)
- Smooth motion through interactive **sliders**, enabling precise parameter adjustments.

### 📸 **2. Integrated RGB Camera Capture**
- The YouBot’s onboard RGB camera captures frames during simulation.
- Images are automatically **stored to a designated directory** for later viewing or processing.
- Useful for:
  - Computer vision tasks  
  - Robotics research  
  - Dataset generation  

### 🖥️ **3. MATLAB App Designer GUI**
- Clean and intuitive layout  
- Slider-based control panel  
- Live simulation interaction  
- Modular and easy to extend  

---

## 🚀 Demo Video
A full demonstration of the GUI teleoperating the YouBot inside CoppeliaSim:

🔗 **Video Link:**  
https://drive.google.com/file/d/1uH2WrsVvn-YeQd9oGTyQYPWGE6Jb8Gnc/view

---

## 🛠️ Technologies Used
- **MATLAB (App Designer)**
- **CoppeliaSim / V-REP**
- **KUKA YouBot**
- MATLAB–CoppeliaSim remote API
