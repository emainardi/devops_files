class docker{
	case $osfamily{
		"debian":{
			exec{"1 Update Repo":command => "/usr/bin/apt update"}	
			
			$pacote = ['apt-transport-https', 'ca-certificates', 'curl', 'gnupg-agent', 'software-properties-common']

			package{
				$pacote:ensure => present
			}	

			exec{
				"3 Add Oficial GPG":
				command => "/usr/bin/curl fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -"
			}

			exec{
				"4 Add Repo ":
		        	command => "/usr/bin/add-apt-repository \"deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable\""
			}
			
			exec{"5 Update Repo": command => "/usr/bin/apt update"}
						
			$doc = ['docker-ce', 'docker-ce-cli', 'containerd.io']	
			
			package{
				$doc:ensure => present
			}
		}			
	}
}
