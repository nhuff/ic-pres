class pm {
  anchor{'pm::begin':}
  anchor{'pm::end':}
  include pm::package
  include pm::config
  include pm::service

  class {'puppetdb':
    database => 'embeded',
  }

  class {'puppetdb::master::config':
    puppetdb_soft_write_failure => true,
    manage_storeconfigs         => true,
    strict_validation           => false,
  }

  exec{'/usr/sbin/puppetdb-ssl-setup':
    creates => '/etc/puppetdb/ssl',
    require => Class['pm::service'],
  }

  class{'mcollective':
    middleware => true,
    client     => true,
    middleware_hosts => ['puppet'],
  }
  $mco_plugins = ['puppet','service','package']
  mcollective::plugin {$mco_plugins:
    package => true,
  }
  Anchor['pm::begin'] -> 
  Class['pm::package'] ->
  Class['pm::config'] ~>
  Class['pm::service'] ->
  Anchor['pm::end']

  firewall{'050 accept pm':
    proto  => 'tcp',
    port   => ['8140','61613'],
    action => 'accept',
  }
}
