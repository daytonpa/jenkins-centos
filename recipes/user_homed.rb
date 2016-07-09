# Create the jenkins user and home directory

# 'jenkins' user
user 'jenkins' do
	comment 'default user'
	home '/var/lib/jenkins'
end

# Home directory
directory '/var/lib/jenkins' do
	user 'jenkins'
	group 'jenkins'
	mode '0755'
end