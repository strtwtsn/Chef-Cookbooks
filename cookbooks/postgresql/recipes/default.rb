#
# Cookbook Name:: postgresql
# Recipe:: default
#
# Copyright 2012, WCMC
#
# All rights reserved - Do Not Redistribute
#
execute "Install Postgresql" do
command <<-EOH
add-apt-repository ppa:pitti/postgresql
apt-get update
apt-get install -y postgresql-9.1 postgresql-server-dev-9.1
EOH
end
