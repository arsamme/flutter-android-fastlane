FROM cimg/android:2022.01
USER root

# Install build tools 30.0.2
RUN echo y | ${CMDLINE_TOOLS_ROOT}/sdkmanager "build-tools;30.0.2"

ENV LANG "en_US.UTF-8"
ENV LANGUAGE "en_US.UTF-8"
ENV LC_ALL "en_US.UTF-8"
ENV PATH="/usr/local/bin/flutter/bin:${PATH}"
# Install and pre-cache Flutter.
RUN wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_2.10.2-stable.tar.xz && \
  tar xf flutter_linux_2.10.2-stable.tar.xz -C /usr/local/bin && \
  rm flutter_linux_2.10.2-stable.tar.xz

RUN /usr/local/bin/flutter/bin/flutter precache --no-web --no-linux --no-windows --no-fuchsia --no-ios --no-macos

# Install fastlane.
RUN gem install rake -N --no-verbose
RUN gem install fastlane -N --no-verbose