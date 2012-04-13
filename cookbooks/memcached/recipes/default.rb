#
# Cookbook Name:: memcached
# Recipe:: default
#
# Copyright 2012, WCMC
#
# All rights reserved - Do Not Redistribute
#
package "memcached"
package "libsasl2-dev"
package "libmemcached-dev" 
package "libmemcached-dbg"

service "memcached" do
  supports :status => true, :restart => true, :reload => true  
  action :stop
end

gem_package "memcache-client" do
  action :install
end

gem_package "memcached" do
  action :install
end
