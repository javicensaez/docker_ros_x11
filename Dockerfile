# This is an auto generated Dockerfile for ros:desktop-full
# generated from docker_images/create_ros_image.Dockerfile.em
FROM ros:noetic

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y terminator ros-noetic-desktop-full ros-noetic-slam-gmapping
RUN apt-get update && apt-get install -y python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
ARG USERNAME=ros
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    #
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME



USER 1000:1000
ENV DISPLAY=:0
ENV xdg_runtime_dir=/run/user/"${uid}"
COPY ./terminator_config /home/$USERNAME/.config/terminator/config
