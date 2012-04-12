#
# Cookbook Name:: postgis
# Recipe:: default
#
# Copyright 2012, WCMC
#
# All rights reserved - Do Not Redistribute
#
execute "Install Postgis and dependencies " do
command <<-EOH
sudo add-apt-repository ppa:ubuntugis/ubuntugis-unstable
sudo apt-get update
sudo apt-get install -y libgdal-dev gdal-bin libgeos-dev libproj-dev
mkdir /home/ubuntu/downloads
cd /home/ubuntu/downloads
svn checkout http://svn.osgeo.org/postgis/trunk@8242 postgis
cd /home/ubuntu/downloads/postgis
./autogen.sh
./configure
make
make install
EOH
end
