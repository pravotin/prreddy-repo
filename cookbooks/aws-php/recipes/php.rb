#
# Cookbook Name:: phpapp
# Recipe:: default
#
# Install PHP 5.5 and Mysql. 
# 
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "mysql::client"

if platform?("ubuntu") 
  execute "apt-get update" do
    action :nothing
    command "apt-get update"
  end
  
  #TODO: pravotin: Why is 5.5 getting installed even if i use the old ppa? 
  # Use PHP 5.4
  apt_repository "php54" do
    uri "http://ppa.launchpad.net/ondrej/php5-oldstable/ubuntu"
    distribution node['lsb']['codename']
    components ["main"]
    keyserver "keyserver.ubuntu.com"
    key "E5267A6C"
  end

#apt_repository "ondrej-php-#{node["lsb"]["codename"]}" do
#  uri "http://ppa.launchpad.net/ondrej/php5/ubuntu"
#  distribution node["lsb"]["codename"]
#  components ["main"]
#  keyserver node["php5_ppa"]["keyserver"]
#  key "E5267A6C"
#  action :add
#  notifies :run, "execute[apt-get update]", :immediately
#end

end

if platform?("amazon") 
  include_recipe "php"
end

