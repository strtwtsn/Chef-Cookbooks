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

bash "configure postgis" do
  user "root"  
  code <<-EOH    
  createdb  -T template0 -O postgres -U postgres -E UTF8 template_postgis
  createlang plpgsql -U postgres -d template_postgis
  psql -d template_postgis -U postgres -f /usr/share/postgresql/8.4/contrib/postgis-1.5/postgis.sql
  psql -d template_postgis -U postgres -f /usr/share/postgresql/8.4/contrib/postgis-1.5/spatial_ref_sys.sql
  ldconfig
  EOH
  only_if { `psql -U postgres -t -c "select count(*) from pg_catalog.pg_database where datname = 'template_postgis'"`.include? '0'}
end

