FROM dockdev/python:2.7

RUN apt-get update && apt-get install libyaml-dev groff pv lftp -y
RUN pip install awscli troposphere boto awacs requests ansible httpie
RUN wget https://releases.hashicorp.com/packer/0.10.0/packer_0.10.0_linux_amd64.zip -O /tmp/packer.zip && unzip -d /usr/local/bin/ /tmp/packer.zip && rm /tmp/packer.zip

# set up aws cli completion
RUN echo "complete -C '/usr/local/bin/aws_completer' aws\n" > /etc/profile.d/awscli.sh
RUN pip install --upgrade requests
