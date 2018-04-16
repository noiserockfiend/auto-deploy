FROM node:9.11.1

RUN mkdir /root/packer
WORKDIR /root/packer

RUN wget https://releases.hashicorp.com/packer/1.2.2/packer_1.2.2_linux_amd64.zip
RUN wget https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip

#RUN apt-get update
RUN yum update

#RUN apt-get install unzip -y
RUN yum install unzip -y
RUN yum install wget -y
RUN unzip packer_1.2.2_linux_amd64.zip -d /usr/local/bin
RUN unzip terraform_0.11.7_linux_amd64.zip -d /usr/local/bin
RUN rm packer_1.2.2_linux_amd64.zip
RUN rm terraform_0.11.7_linux_amd64.zip

RUN mkdir /root/git
WORKDIR /root/git

# Install Git, from https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
RUN sudo apt-get install dh-autoreconf libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev
RUN sudo apt-get install asciidoc xmlto docbook2x getopt
RUN sudo ln -s /usr/bin/db2x_docbook2texi /usr/bin/docbook2x-texi

RUN wget https://github.com/git/git/archive/v2.17.0.zip -O git.zip
RUN unzip git.zip
WORKDIR /root/git/git-2.17.0
RUN make configure
RUN ./configure --prefix=/usr
RUN make all
RUN make all doc info
RUN sudo make install install-doc install-html install-info
