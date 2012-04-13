#
# Cookbook Name:: postgresql
# Recipe:: default
#
# Copyright 2012, WCMC
#
# All rights reserved - Do Not Redistribute
#

gem_package "pg" do
  action :install
end



execute "Install Postgresql" do
command <<-EOH
add-apt-repository ppa:pitti/postgresql
apt-get update
apt-get install -y postgresql-9.1 postgresql-server-dev-9.1
EOH
end

# Allow access from EC2 IPs

template "/etc/postgresql/9.1/main/pg_hba.conf" do
  source "pg_hba.conf.erb"
  owner "postgres"
  group "postgres"
  mode 0600
  notifies :restart, resources(:service => "postgresql"), :immediately
end

