#!/bin/bash

# Provide public key
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

# Install RVM stable with ruby
\curl -sSL https://get.rvm.io | bash -s stable --ruby

#Install dependencies for the project
gem install mechanize
gem install nokogiri
gem install pry