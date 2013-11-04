host{'puppet':
  ensure => 'present',
  host_aliases => ['puppet.home','puppet.Home','localhost','localhost.localdomain','puppet.localdomain'],
  ip => '127.0.0.1',
}

include pm
