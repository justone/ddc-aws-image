FROM skegio/python:2.7

RUN add-apt-repository ppa:neovim-ppa/unstable && \
    apt-get update && apt-get install -y neovim python-dev python-pip python3-dev python3-pip telnet libssl-dev libffi-dev && \
    pip install neovim && \
    pip3 install neovim

RUN add-apt-repository ppa:jonathonf/vim && \
    apt update && apt install -y vim-nox

RUN apt-get update && apt-get install libyaml-dev groff pv lftp zip multitail rsync python3.4-venv -y
RUN pip install awscli troposphere boto awacs requests ansible httpie pre-commit
RUN wget https://releases.hashicorp.com/packer/1.0.3/packer_1.0.3_linux_amd64.zip -O /tmp/packer.zip && unzip -d /usr/local/bin/ /tmp/packer.zip && rm /tmp/packer.zip

# set up aws cli completion
RUN echo "complete -C '/usr/local/bin/aws_completer' aws\n" > /etc/profile.d/awscli.sh
RUN pip install --upgrade requests
