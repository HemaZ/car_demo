FROM osrf/ros:melodic-desktop

RUN apt-get update \
 && apt-get install -y \
    wget \
    lsb-release \
    sudo \
    mesa-utils \
 && apt-get clean


# Get gazebo binaries
RUN echo "deb http://packages.osrfoundation.org/gazebo/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list \
 && wget http://packages.osrfoundation.org/gazebo.key -O - | apt-key add - \
 && apt-get update \
 && apt-get install -y \
    gazebo9 \
<<<<<<< HEAD
    ros-kinetic-gazebo9-ros-pkgs \
    ros-kinetic-fake-localization \
    ros-kinetic-joy \
=======
    ros-melodic-gazebo-ros-* \
    ros-melodic-fake-localization \
    ros-melodic-joy \
>>>>>>> 2d6741edb1be1b917dcae3c75fa75b1e82ee032a
 && apt-get clean


RUN mkdir -p /tmp/workspace/src
COPY prius_description /tmp/workspace/src/prius_description
COPY prius_msgs /tmp/workspace/src/prius_msgs
COPY car_demo /tmp/workspace/src/car_demo
RUN /bin/bash -c 'cd /tmp/workspace \
 && source /opt/ros/melodic/setup.bash \
 && catkin_make'


CMD ["/bin/bash", "-c", "source /opt/ros/melodic/setup.bash && source /tmp/workspace/devel/setup.bash && roslaunch car_demo demo.launch"]
