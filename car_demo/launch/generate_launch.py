f = open("generate.launch", "r")
content = f.read()
f.close()

with open("test.launch", "w+") as file:
    file.write(content)
    file.write("\n")
    for i in range(6):
        ns_ = "prius{}".format(i)
        spawn = ' <group ns="{}"> <param name="robot_description" textfile="$(arg model)" /><node pkg="robot_state_publisher" type="robot_state_publisher" name="robot_state_publisher" output="screen"><param name="publish_frequency" type="double" value="50.0" /><param name="tf_prefix" value="{}" /></node><node name="spawn_urdf" pkg="gazebo_ros" type="spawn_model" args="-urdf -model {} -x {} -y $(arg y) -z 0.5 -param robot_description" /></group>'.format(
            ns_, ns_, ns_, (i * 6 + 3)
        )
        file.write(spawn)
        file.write("\n")
    file.write("</launch>")

