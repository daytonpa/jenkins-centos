#
# Cookbook Name:: jenkins-centos
# Recipe:: install_jenkins.rb
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# Create the 'yum_repository' resource
include_recipe 'yum::default'
include_recipe 'jenkins-centos::user'

# Download the Jenkins repository and key
node['jenkins-centos']['repo'].tap do |repo|

	yum_repository repo['name'] do
		description 	repo['description']
		enabled 		true
		baseurl 		repo['baseurl']
		gpgkey 			repo['gpgkey']
		timeout 		repo['timeout']
	end

end

# Install correct version of Java
include_recipe 'jenkins-centos::install_java'

# Install Jenkins
yum_package node['jenkins-centos']['repo']['name'] do
	action 		:install
end

# Set the home directory permissions
directory node['jenkins-centos']['home_dir'] do
	user 		node['jenkins-centos']['user']
	group 		node['jenkins-centos']['group']
	mode 		'0755'
	recursive 	true
end

# Start Jenkins service
service node['jenkins-centos']['repo']['name'] do 
	supports 	status: true, restart: true, reload: true
	action 		[ :enable, :restart ]
end