# jenkins-centos

This cookbook is for the installation of Jenkins on Centos.

Contains 3 recipes:
	- install_jenkins.rb (main recipe)
	- install_java.rb
	- user.rb

	install_java.rb
		Uninstalls the default Java version (1.5.0) included with CentOS and installs Java 1.7.0 OpenJDK, which is needed for running the Jenkins service

	user.rb
		Creates the user 'jenkins' and group 'jenkins' by default

	install_jenkins.rb
		Downloads the Jenkins repository and installs it.  Also starts the Jenkins service

Depends on Yum cookbook