FROM circleci/ruby:2.4

RUN sudo apt-get update -qq && \
  sudo apt-get install -y --no-install-recommends unzip python-dev && \
  curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - && \
  sudo apt-get install -y nodejs && \
  sudo curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" && \
  sudo unzip awscli-bundle.zip && \
  sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && \
  sudo rm -rf ./awscli-bundle awscli-bundle.zip

WORKDIR /home/circleci
