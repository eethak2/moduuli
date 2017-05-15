# Oman moduulin tekeminen

## Aloitus

Tehtävän tarkoitus on luoda oma moduuli. Päätin tehdä yksinkertaisen moduulin, joka asentaa ja konfiguroi apachen käyttökuntoon.
Apachen lisäksi moduulin tarkoitus olisi myös asentaa muutama muu ohjelma.
Aloitin moduulin tekemisen päivittämällä järjestelmän ajan tasalle.

## Apache

Ensimmäiseksi latasin puppetin
```
sudo apt-get install puppet
```
Jonka jälkeen tein site.pp-tiedoston puppetin manifests hakemistoon.

site.pp-tiedoston sisällöksi tuli
``` 
class{apache:}
```
Seuraavaksi tein puppetin modules hakemiston sisään "apache" hakemiston.

```
sudo mkdir apache
```
apache hakemiston sisään tein manifests-hakemiston.

Manifests-hakemiston sisään loin tiedoston init.pp
```
sudoedit init.pp
```
init.pp sisältö näytti tältä
```
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
```
Niinkuin näkyy, moduuli asentaa myös vlc-playerin, sekä libreoffice paketit.

Sen jälkeen siirsin moduulini gittiin.

```
git add .
git commit
git push
git pull
```

Lähteet:
http://terokarvinen.com/2013/ssh-server-puppet-module-for-ubuntu-12-04
https://www.puppetcookbook.com/


