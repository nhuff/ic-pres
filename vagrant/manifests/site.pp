node default {
  include epel
  $mco_plugins = ['puppet','service','package']
  include mcollective
  mcollective::plugin {$mco_plugins:
    package => true,
  }
  include s_collectd
  include s_mysql
  Class['epel'] -> Class['s_collectd']
}
