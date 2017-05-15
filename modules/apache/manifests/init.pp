class apache {
	
	package { 'apache2':
	ensure => 'installed',
	allowcdrom => 'true',
	}

	package { 'vlc':
	ensure => 'installed',
	allowcdrom => 'true',
	}

	package { 'libreoffice':
	ensure => 'installed',
	allowcdrom => 'true',
	}

service {'apache2':
	ensure => 'running',
	require => Package ['apache2'],
	}

exec { 'userdir':
	notify => Service['apache2'],
	command => '/usr/sbin/a2enmod userdir',
	require => Package['apache2'],
	}

}
