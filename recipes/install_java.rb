# Install proper Java version

# Remove Java 1.5.0: Default CentOS version of Java 
execute 'remove java 1.5.0' do
	command 'yum remove java'
	action :nothing
end

# Install Java 1.7.0
yum_package 'java-1.7.0-openjdk' do
	action :install
end