#
# Cookbook Name:: jenkins-centos
# Recipe:: user_homed.rb
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# Create the jenkins user, group, log and home directory

# User
user node['jenkins-centos']['user'] do
	comment node['jenkins-centos']['comment']
	home 	node['jenkins-centos']['home_dir']
end

# Group
group node['jenkins-centos']['group'] do
	members node['jenkins-centos']['user']
end