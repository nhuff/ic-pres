class s_mysql (
  $root_password,
  $databases = {},
  $users = {},
  $grants = {},
) {
  $collectd_pass = 'foobar'

  class{'mysql::server':
    root_password => $root_password,
  }
  resources {['mysql_database','mysql_user','mysql_grant']:
    purge => true,
  }
  mysql_database{['mysql','information_schema']:
    ensure => 'present',
  }
  mysql_grant{'root@localhost/*.*':
    ensure     => 'present',
    options    => ['GRANT'],
    privileges => ['ALL'],
    table      => '*.*',
    user       => 'root@localhost',
  }
  mysql_user{'collectd@localhost':
    ensure => 'present',
    password_hash => mysql_password($collectd_pass),
  }
  mysql_grant{'collectd@localhost/*.*':
    ensure     => 'present',
    privileges => ['USAGE'],
    table      => '*.*',
    user       => 'collectd@localhost',
  }

  if $::osfamily == 'RedHat' {
    package{'collectd-mysql':
      ensure => 'installed',
      notify => Service['collectd'],
    }
  }

  file{"${collectd::plugin_conf_dir}/mysql.conf":
    ensure  => file,
    content => template('s_mysql/mysql.conf.erb'),
    notify  => Service['collectd'],
  }

  firewall{'050 allow mysql':
    proto  => 'tcp',
    port   => '3306',
    action => 'accept',
  }
  create_resources(mysql_db,$databases)
  create_resources(mysql_user,$users)
  create_resources(mysql_grants,$grants)
}
