## This a project building a 4 wheel differential drive robot monitoring any anomalies in a warehouse.
To run the project,
-- Create a ros2 C++ workspace.
    # mkdir -p ~/ros2_ws/src/line_following_rover
-- Go to ros2_workspace/src/line_following_rover
    #  cd ~/ros2_ws/src/line_following_rover 
-- Clone repo
    # git clone https://github.com/ABMSaleheen/Line_Following_Rover.git -b main

Project Flow------

Step 1 -- Modeling the Robot.

    The robot was designed from scratch using, Solidoworks CAD modeling software. It has the following components:
        -- Chassis.
        -- 4 Wheels with Gazebo differential drive plugin.
        -- 2 Lidars, Front and Back each covering a range of 4 meters in its 180 degrees zone.
            -- Purpose is to detect collisions and 
        -- 2 cameras, Front and Back. Purpose is to do Computer Vision to follow a track as well as observe surroundings.

    Solidoworks' sw2urdf extension was used to export the urdf model of the robot from the cad model. The model components are saved in .stl format in a folder which is then referred to inside the urdf file. To implement specific colors on each component, it is necessary to convert the .stl into a .dae model file using Blender or similar software.

Step 2 -- Creating a .world file and Launching in Gazebo.
    # colcon build --packages-select line_following_rover
    # ros2 launch line_following_rover rviz.launch.py

    -- Model Setup: Begin by adding a box model in Gazebo to serve as the base surface. Assign a small height to the box to make it resemble a flat plane.
    -- Surface Design: The track design was sketched using a painting application and saved in .jpg format. The aspect ratio of the track image was used to determine the dimensions of the box surface to ensure the image fits correctly without distortion.
    -- Final Integration: The .jpg file was applied as a texture to the box model, and the .world file was configured to include this setup.
    -- A simple Python launch file (rviz.launch.py) was created to load the robot model into the custom world. The launch file initializes the environment with the robot model and allows placement of the rover at a desired location within the world. Once the rover is positioned correctly, the updated world can be saved by overwriting the previous .world file. This ensures that in subsequent launches, the rover is automatically spawned at the saved location, eliminating the need for manual repositioning.

Step 3 -- Running the AutonmousDriving Node.
    # ros2 run line_following_rover autonmous_driving_node

    -- The Autonomous Driving Node processes the raw camera feed to enable track-following behavior. It subscribes to the camera's raw image topic and utilizes computer vision techniques (via the cv2 library) to detect and track the middle point between the track's edges. This middle point guides the rover's steering, ensuring it stays centered on the track.
    Simultaneously, the node tracks an imaginary point ahead of the camera to maintain forward motion. Both the steering and forward motion are controlled using simple Proportional-Derivative (PD) controllers for smooth and responsive operation.



