#!/usr/bin/env bash

#
# Add repository for an early-21st-century version of gradle:
add-apt-repository ppa:cwchien/gradle
apt-get update


#########################################################
### Install packages required for HMT editing ###########
#########################################################

# Clean up any catastrophic reformatting that
# 'git clone' could introduce on a Windows box:
apt-get install -y dos2unix
/usr/bin/dos2unix /vagrant/system/*sh
/usr/bin/dos2unix /vagrant/system/dotprofile
/usr/bin/dos2unix /vagrant/scripts/*sh

# and add bomstrip utils in case XML Copy Editor
# or evil Windows software tries to insert a BOM
# in your editorial work:
apt-get install -y bomstrip

# version control
apt-get install -y git



# XML editor
apt-get install -y xmlcopyeditor

#########################################################
### Web
apt-get -y install firefox
## alpheios must be manually installed?


#########################################################
### Markdown bundle
#########################################################

apt-get -y install mdpress
apt-get -y install pandoc


# Set up vagrant user account:
cp /vagrant/system/dotprofile /home/vagrant/.profile
chown vagrant:vagrant /home/vagrant/.profile

cp /vagrant/system/mimeapps.list /home/vagrant/.config
chown vagrant:vagrant /home/vagrant/.config/mimeapps.list

rm /home/vagrant/.config/plank/dock1/launchers/*.dockitem
cp /vagrant/system/plank-dock1-launchers/*.dockitem /home/vagrant/.config/plank/dock1/launchers
chown vagrant:vagrant /home/vagrant/.config/plank/dock1/launchers/*.dockitem


if [ ! -e /usr/bin/atom ]
    then
      # Add Atom:
      echo "Downloading .deb file for Atom"
      /usr/bin/wget https://github.com/atom/atom/releases/download/v1.0.11/atom-amd64.deb 2> /tmp/atom-log.txt
      echo "Download complete, installing Atom"
      /usr/bin/dpkg --install atom-amd64.deb
      echo "Atom installed. "
fi

apt-get -y -q upgrade
apt-get -y -q install software-properties-common htop
add-apt-repository ppa:webupd8team/java
apt-get -y -q update
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
apt-get -y -q install oracle-java8-installer
update-java-alternatives -s java-8-oracle



apt-get remove scala-library scala
wget www.scala-lang.org/files/archive/scala-2.11.8.deb
dpkg -i scala-2.11.8.deb
apt-get update
apt-get install scala

echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
apt-get update
apt-get install sbt


curl -L -o /usr/local/bin/amm https://git.io/v6j0F && chmod +x /usr/local/bin/amm

cp /vagrant/system/predef.sc /home/vagrant/.ammonite

# http://downloads.lightbend.com/scala/2.11.7/scala-2.11.7.deb ?
