FROM ubuntu:22.04

# Timezone
ENV TZ=America/Fortaleza
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Prerequisites
RUN apt update && apt install -y curl git unzip xz-utils zip libglu1-mesa openjdk-17-jdk wget
RUN apt-get update && apt-get install -y clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev libstdc++-12-dev

# Set up new user
RUN useradd -ms /bin/bash developer
USER developer
WORKDIR /home/developer

# Prepare Android directories and system variables
RUN mkdir -p Android/sdk/cmdline-tools/latest
ENV ANDROID_SDK_ROOT /home/developer/Android/sdk
RUN mkdir -p .android && touch .android/repositories.cfg

# Set up Android SDK
RUN wget -O commandlinetools.zip https://dl.google.com/android/repository/commandlinetools-linux-10406996_latest.zip
RUN unzip commandlinetools.zip && rm commandlinetools.zip
RUN mv cmdline-tools/* Android/sdk/cmdline-tools/latest
RUN cd Android/sdk/cmdline-tools/latest/bin && yes | ./sdkmanager --licenses
RUN cd Android/sdk/cmdline-tools/latest/bin && ./sdkmanager "build-tools;33.0.2" "patcher;v4" "platform-tools" "platforms;android-33" "sources;android-33"
ENV PATH "$PATH:/home/developer/Android/sdk/platform-tools"

# Download Flutter SDK
RUN wget -O flutter.tar.xz https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.13.6-stable.tar.xz
RUN tar xf flutter.tar.xz && rm flutter.tar.xz
ENV PATH "$PATH:/home/developer/flutter/bin"

# Run basic check to download Dark SDK
RUN flutter doctor
