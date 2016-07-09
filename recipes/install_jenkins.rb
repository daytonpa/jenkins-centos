#
# Cookbook Name:: jenkins-centos
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# Create the 'yum_repository' resource
include_recipe 'yum::default'

# Create the jenkins user and home directory
include_recipe 'jenkins-centos::user_homed'

# Download the Jenkins 2 repository and key
yum_repository 'jenkins' do
	description 'Jenkins 2.12-2.1 Repository'
	enabled true
	baseurl 'http://pkg.jenkins-ci.org/redhat'
	gpgkey 'http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key'
	timeout '60'
	notifies :run, 'execute[remove java 1.5.0]', :immediately
end

#     The default CentOS version of Java is not compatible with 
# Jenkins. Jenkins typically works best with a Sun 
# implementation of Java, which is not included in CentOS for 
# licensing reasons.

include_recipe 'jenkins-centos::install_java'

# Install Jenkins 2
yum_package 'jenkins' do
	action :install
end

# Start Jenkins 2 service
service 'jenkins' do 
	supports status: true, restart: true, reload: true
	action [ :enable, :restart ]
end