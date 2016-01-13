# Pull base image.
FROM ubuntu:15.10
EXPOSE 8080
# Install.
RUN apt-get clean
RUN apt-get update
RUN apt-get -y upgrade
RUN \
  apt-get install -y git && \
  apt-get install -y ant
# openJDK
RUN \
  apt-get install -y openjdk-7-jre && \
  apt-get install -y openjdk-7-jdk

# oracle-JDK
# RUN \
#   add-apt-repository ppa:webupd8team/java && \
#   apt-get update && \
#   echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
#   apt-get install -y oracle-java7-installer

# clone ezScrum into "home" folder
RUN \
  cd home && \
  git config --global user.email "tt.ezscrum@gmail.com" && \
  git config --global user.name "lab1321" && \
  git clone https://github.com/ezScrum/ezScrum.git && \
  cd ezScrum && \
CMD git pull origin develop
#  ant compileSourceCode cleanUT.Dir compileUTcode runUT
  #compileSourceCode, cleanUT.Dir, compileUTcode, runUT
