#
# Cookbook Name:: postfix
# Recipe:: default
#
# Copyright 2012, WCMC
#
# All rights reserved - Do Not Redistribute
#
bash "install postfix" do
  code "DEBIAN_FRONTEND=noninteractive apt-get install -y postfix"  
end  

service "postfix" do
  service_name "postfix"
  supports :restart => true, :status => true, :reload => true
end
