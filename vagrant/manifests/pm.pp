host{'puppet':
  ensure => 'present',
  host_aliases => ['puppet.home','puppet.Home','localhost','localhost.localdomain'],
  ip => '127.0.0.1',
}

include pm

#class { 'puppetdb':
#  database           => 'embeded',
#}
#class {'puppetdb::master::config':
#  puppetdb_server         => 'puppet',
#  manage_report_processor => true,
#}
#Class['puppet::server'] -> Class['puppetdb'] -> Class['puppetdb::master::config']
