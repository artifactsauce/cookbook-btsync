#
# Cookbook Name:: btsync
# Recipe:: default
#
# Copyright 2014, Kenji Akiyama
#
# All rights reserved - Do Not Redistribute
#

include_recipe "apt"

apt_repository 'btsync' do
  uri 'http://ppa.launchpad.net/tuxpoldo/btsync/ubuntu'
  distribution 'trusty'
  components   ['main']
  keyserver    'keyserver.ubuntu.com'
  key          'D294A752'
end

package 'btsync'

template '/etc/btsync/debconf-default.conf' do
  source 'default.erb'
  owner node['btsync']['owner']
  group node['btsync']['group']
  mode '0400'
  notifies :run, "execute[reload-setting]", :immediately
end

execute 'reload-setting' do
  command "service btsync force-reload"
  action :nothing
end
