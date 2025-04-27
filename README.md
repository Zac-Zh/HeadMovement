
- **`main.m`**  
  Orchestrates the full analysis:
  1. Loads `StaticPhase.mat` → builds thoracic anatomical frame via `frame4AC.m` & plots it.  
  2. Loads `DynamicPhase.mat` → computes rotation angles (`calculate_rotation_angles.m`), applies rotation to head markers (`Computingthehead.m`), and visualizes results.  
  3. Calls plotting & analysis routines: `visualizePointsOverTime.m`, `visualizeMotionAndVelocity.m`, `calculateTheAngle.m`.

- **`frame4AC.m`**  
  Constructs an anatomical frame (origin + orthonormal axes) from two Acromion markers and two gravity reference points.

- **`plotAnatomicalThorax.m`**  
  Plots the static-phase thorax frame and landmark points in the global coordinate system for visual verification.

- **`calculate_rotation_angles.m`**  
  Computes sequential rotation angles (z-axis, x-axis, y-axis) needed to align the thoracic frame with the global frame, returning both Euler angles and rotation matrices.

- **`Computingthehead.m`**  
  Applies the combined rotation matrix to the dynamic-phase head marker coordinates to express head motion in the thoracic anatomical frame.

- **`visualizePointsOverTime.m`**  
  Animates or scatter-plots the x/y/z coordinates of the rotated head origin across all time points.

- **`visualizeMotionAndVelocity.m`**  
  Plots the head’s spatial trajectory and instantaneous velocity magnitude over time.

- **`calculateTheAngle.m`**  
  Computes joint angles (e.g., flexion/extension) from the rotated head origin relative to the thorax and plots angle vs. time.

- **`StaticPhase.mat`**  
  Contains:
  - `StaticPhase.Time` (ms)  
  - `StaticPhase.AcLeft`, `StaticPhase.AcRight` (mm)  
  - `StaticPhase.ZGravity1`, `StaticPhase.ZGravity2` (mm)  

- **`DynamicPhase.mat`**  
  Contains:
  - `DynamicPhase.Time` (ms)  
  - Thorax tripod points: `TripodThoraxPt1/2/3` (mm)  
  - Head tripod points:   `TripodHeadPt1/2/3/4` (mm)  

---

## Usage

1. Open MATLAB and add this folder to your path.  
2. Ensure `StaticPhase.mat` and `DynamicPhase.mat` are in the working directory.  
3. In the Command Window, type:
   ```matlab
   main
