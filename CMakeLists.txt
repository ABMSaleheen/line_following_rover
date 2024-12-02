cmake_minimum_required(VERSION 3.8)
project(line_following_rover)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# find dependencies
find_package(ament_cmake REQUIRED)
# find_package(robot_state_publisher REQUIRED)
# find_package(joint_state_publisher REQUIRED)
# find_package(joint_state_publisher_gui REQUIRED)
# find_package(gazebo_ros REQUIRED)

set(BUILD_SHARED_LIBS OFF)

find_package(OpenCV REQUIRED)
find_package(rclcpp REQUIRED)
find_package(std_msgs REQUIRED)
find_package(geometry_msgs REQUIRED)
find_package(sensor_msgs REQUIRED)
find_package(nav_msgs REQUIRED)
# find_package(NumCpp REQUIRED)
find_package(cv_bridge REQUIRED)

# uncomment the following section in order to fill in
# further dependencies manually.
# find_package(<dependency> REQUIRED)

if(BUILD_TESTING)
  find_package(ament_lint_auto REQUIRED)
  # the following line skips the linter which checks for copyrights
  # comment the line when a copyright and license is added to all source files
  set(ament_cmake_copyright_FOUND TRUE)
  # the following line skips cpplint (only works in a git repo)
  # comment the line when this package is in a git repo and when
  # a copyright and license is added to all source files
  set(ament_cmake_cpplint_FOUND TRUE)
  ament_lint_auto_find_test_dependencies()
endif()


add_executable(video_save_node src/video_save.cpp)
ament_target_dependencies(video_save_node rclcpp std_msgs geometry_msgs sensor_msgs OpenCV cv_bridge)

add_executable(autonomous_driving_node src/autonomous_driving.cpp)
ament_target_dependencies(autonomous_driving_node rclcpp std_msgs sensor_msgs geometry_msgs OpenCV cv_bridge)



#----------------  Install each executable to lib ---------------------------------
install(TARGETS video_save_node
                autonomous_driving_node 
        DESTINATION lib/${PROJECT_NAME}
      )

# Include directories
include_directories(include) 
include_directories("/home/saleheen_linux/Libraries/NumCpp/include")
include_directories( ${OpenCV_INCLUDE_DIRS} )

# Install include directory
install(DIRECTORY include/
  DESTINATION include/${PROJECT_NAME}
)

# Install URDF files
install(DIRECTORY urdf
  DESTINATION share/${PROJECT_NAME}
)

# Install World files
install(DIRECTORY worlds
  DESTINATION share/${PROJECT_NAME}
)

# Install Launch files
install(DIRECTORY launch
  DESTINATION share/${PROJECT_NAME}
)


ament_package()


