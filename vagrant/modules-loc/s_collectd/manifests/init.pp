class s_collectd {
  class{'collectd':
    purge        => true,
    recurse      => true,
    purge_config => true,
  }
  include collectd::plugin::syslog

  file{"${collectd::plugin_conf_dir}/csv.conf":
    ensure => 'file',
    source => "puppet:///modules/s_collectd/csv.conf",
    notify => Service['collectd'],
  }

}
