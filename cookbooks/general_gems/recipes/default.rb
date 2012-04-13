#
# Cookbook Name:: general_gems
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "libonig2"
package "libonig-dev"
package "libxml2"
package "libxml2-dev"
package "libxslt1.1"
package "libxslt1-dev"
package "libcurl4-gnutls-dev"
package "unzip"


gem_package "nokogiri" do
  action :install
end

gem_package "oniguruma" do
  action :install
end

gem_package "yajl-ruby" do
  action :install
end

gem_package "rake" do
  action :install
end

gem_package "rack" do
  action :install
end

gem_package "rack" do
  action :install
end

gem_package "riddle" do
  action :install
end

gem_package "rails" do
  action :install
end

gem_package "SystemTimer" do
  action :install
end

gem_package "macaddr" do
  action :install
end

gem_package "bson" do
  action :install
end

gem_package "after_commit" do
  action :install
end

gem_package "rcov" do
  action :install
end

gem_package "ppe-panoramio" do
  action :install
end

gem_package "aws-s3" do
 action :install
end

gem_package "bson_ext" do
  action :install
end

