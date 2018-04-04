FROM ruby:2.5.1

RUN apt-get update -qq && \
  apt-get install -y --no-install-recommends unzip python-dev && \
  curl -sL https://deb.nodesource.com/setup_6.x > node_setup.sh && \
  chmod a+x node_setup.sh && \
  ./node_setup.sh && \
  apt-get install -y --no-install-recommends nodejs && \
  curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" && \
  unzip awscli-bundle.zip && \
  ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && \
  rm -rf ./awscli-bundle awscli-bundle.zip
