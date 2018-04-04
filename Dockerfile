FROM circleci/ruby:2.4

RUN sudo apt-get update -qq && \
  sudo apt-get install -y --no-install-recommends unzip python-dev && \
  curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash - && \
  sudo apt-get install -y nodejs && \
  sudo curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" && \
  sudo unzip awscli-bundle.zip && \
  sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && \
  sudo rm -rf ./awscli-bundle awscli-bundle.zip

RUN sudo mkdir -p /home/executor && \
  sudo useradd executor -u 999 -G circleci -s /bin/bash -d /home/executor && \
  sudo chown -R executor:$(id -gn executor) /home/executor

WORKDIR /home/executor
