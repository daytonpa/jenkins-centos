require 'spec_helper'

describe 'jenkins-centos::default' do
	
  	# Serverspec examples can be found at
  	# http://serverspec.org/resource_types.html

  	describe group('jenkins') do
  		it { should exist }
  	end

 	describe user('jenkins') do
  		it { should exist }
  		it { should belong_to_group 'jenkins' }
  	end

  	describe file('/etc/yum.conf') do
  		it { should exist }
  	end

  	describe file('/etc/yum.repos.d') do
  		it { should exist }
  	end

  	describe file('/var/lib/jenkins') do
  		it { should exist }
  		it { should be_directory }
  		it { should be_owned_by 'jenkins' }
  		it { should be_grouped_into 'jenkins' }
  		it { should be_mode '0755' }
  	end

  	describe yumrepo('jenkins') do
  		it { should exist }
  		it { should be_enabled }
  	end

  	describe package('java-1.7.0-openjdk') do
  		it { should be_installed }
  	end

  	describe package('jenkins') do
  		it { should be_installed }
  		it { should be_installed.with_version('2.12-1.1')}
  		# Jenkins 2.12-1.1 was last modified 2016/07/05
  	end

  	describe port('8080') do
  		it { should be_listening }
  		it { should be_listening.on('0.0.0.0') }
  	end

  	describe service('jenkins') do
  		it { should be_running }
  	end

end
