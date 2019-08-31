class arthur_curry {
	case $osfamily{
		"redhat": {
			$pacote = ['apel-release', 'git', 'vim', 'fortune-mod', 'figlet', 'fish']
		}
		"debian": {			
			exec{'atualiza_remo': command => "/usr/bin/apt update"}
			$pacote = ['git', 'vim', 'fortunes-br', 'figlet', 'fish', 'sysstat']
		}
	}
	
	package{
		$pacote:ensure => present		
	}
	
	file{
		'/root/.bashrc': source => "puppet:///modules/arthur_curry/bashrc_base",
                                 ensure => present
	}
	
	file{
		'/root/.bash_logout': source => "puppet:///modules/arthur_curry/bashrc_logout",
                                 ensure => present
	}

	user{
		'aqualad': ensure => present,
			   managehome => true,
			   shell => "/usr/bin/fish",
                           password => Sensitive("4linux")
	}
}
