# Autonomous Vehicle Simulation Using Q-Learning in GameMaker

## 🚗 Project Overview
This project demonstrates the implementation of **Q-Learning**, a reinforcement learning algorithm, to train autonomous vehicles to navigate a track without collisions. 

The simulation was built in **GameMaker** and explores how Q-Learning can be applied in an interactive environment. This is a **first project** focused on understanding the basics of reinforcement learning applied to a practical problem, such as teaching a vehicle to complete a track autonomously.

While the implementation is functional, there is room for significant optimizations, such as enhancing the reward system, scaling to more complex environments, or exploring advanced algorithms.

## 🎯 Objectives
- **Teach vehicles to navigate a track autonomously**:
  - Avoid collisions using sensor data.
  - Learn optimal actions (turn left, turn right, or go straight) based on rewards and penalties.
- **Explore collaborative learning**:
  - Multiple vehicles operate in parallel, sharing a common Q-table to accelerate learning.
- **Visualize learning progress**:
  - Metrics such as lifetime, Q-table values, and rewards are displayed in real-time.
 
## 🛠️ Key Features
- **Sensors-Based Navigation**:
  - Vehicles use front, left, and right sensors to detect proximity to obstacles.
- **Q-Learning**:
  - Implements epsilon-greedy action selection to balance exploration and exploitation.
- **Multi-Agent Environment**:
  - Multiple vehicles contribute to a shared Q-table for faster learning.
- **Reward System**:
  - Encourages forward movement while penalizing collisions and inefficient actions.
- **Metrics Visualization**:
  - Displays the Q-table, vehicle-specific metrics, and best performance in real-time.

 ## 📊 Metrics Tracked
- **Q-Table**:
  - An \(8 \times 3\) table representing state-action value pairs for all sensor combinations.
- **Per-Vehicle Metrics**:
  - Direction, epsilon, reward, lifetime (in seconds), and intent count.
- **Best Performance**:
  - Tracks the best lifetime achieved by any vehicle, along with its instance and intent count.

## 🧪 How It Works
1. **Initialization**:
   - The main controller creates the Q-table and spawns multiple vehicles.
   - Vehicles start with a high exploration rate epsilon = 1.0.

2. **Training**:
   - Vehicles sense their environment using sensors and select actions using epsilon-greedy.
   - Rewards and penalties adjust the Q-table values in real-time.

3. **Metrics Display**:
   - Shows Q-table values and per-vehicle metrics like lifetime and intent count.

## 🎥 Demo

[![Watch the demo video](https://github.com/cjm161086/Race-AI/blob/main/Preview.jpg)](https://www.dropbox.com/scl/fi/03tirev3wmgpii6eccsfu/Demo-Race-AI.mp4?rlkey=zdzfasujtdz3w8q4a2al94s0m&raw=1)

Click on the image to watch the demo video on Dropbox.




