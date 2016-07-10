default['jenkins-centos'].tap do |default|

	default['user'] 			= 'jenkins'
	default['comment'] 			= 'default user'
	default['group'] 			= 'jenkins'
	default['owner'] 			= 'jenkins'
	default['home_dir']			= '/var/lib/jenkins'
	default['log_dir']			= '/var/log/jenkins'

	default['repo'].tap do |repo|

		repo['name']			= 'jenkins'
		repo['description'] 	= 'Jenkins 2.12-2.1 Repository'
		repo['baseurl'] 		= 'http://pkg.jenkins-ci.org/redhat'
		repo['gpgkey'] 			= "#{repo['baseurl']}/jenkins-ci.org.key"
		repo['timeout'] 		= '60'

	end
end