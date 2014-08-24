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

package 'nginx'
package 'btsync'
