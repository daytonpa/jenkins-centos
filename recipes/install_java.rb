#
# Cookbook Name:: jenkins-centos
# Recipe:: install_java.rb
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

#     The default CentOS version of Java is not compatible 
# with Jenkins. Jenkins typically works best with a Sun 
# implementation of Java, which is not included in CentOS for 
# licensing reasons.

# Install proper Java version

# Remove Java 1.5.0: Default CentOS version of Java 
execute 'remove java 1.5.0' do
	command 	'yum remove java'
	action 		:nothing
	subscribes 	:run, "yum_repository['#{node['jenkins-centos']['repo']['name']}']", :immediately
end

yum_package node['jenkins-centos']['java']['version'] do
	action 		:install
end