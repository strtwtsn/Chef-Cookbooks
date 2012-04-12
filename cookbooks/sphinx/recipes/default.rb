#
# Cookbook Name:: sphinx
# Recipe:: default
#
# Copyright 2012, WCMC
#
# All rights reserved - Do Not Redistribute
#
package "postgresql-server-dev-8.4"

# Sphinx 2.0.4
remote_file "download sphinx" do
  path "/tmp/sphinx-2.0.4-release.tar.gz"
  source "http://sphinxsearch.com/files/sphinx-2.0.4-release.tar.gz"
end 
 
 # remove with dpkg -r sphinx
bash "install sphinx" do
  user "root"
  cwd "/tmp"
  code <<-EOH    
  tar zxvf sphinx-2.0.4-release.tar.gz
  cd /tmp/sphinx-2.0.4*
  ./configure --with-pgsql --without-mysql
  make
  checkinstall --pkgname sphinx --pkgversion 2.0.4-src --default 
  EOH
  only_if { `which searchd`.empty?}
end

gem_package "thinking-sphinx" do
  action :install
#  version "1.3.16"
end
