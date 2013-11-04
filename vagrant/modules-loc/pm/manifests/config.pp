class pm::config {
  Ini_setting {
    ensure  => 'present',
    path    => '/etc/puppet/puppet.conf',
    section => 'master',
  }

  ini_setting {"pm_modpath":
    setting => 'modulepath',
    value   => '/vagrant/modules:/vagrant/modules-loc',
  } 
  ini_setting {"pm_manifestdir":
    setting => 'manifestdir',
    value   => '/vagrant/manifests',
  } 
  ini_setting {"pm_report":
    setting => 'reports',
    value   => 'puppetdb',
  }
  ini_setting {'pm_hiera':
    setting => 'hiera_config',
    value   => '/vagrant/hiera/hiera.yml'
  }

  file{'/etc/puppet/autosign.conf':
    ensure  => file,
    content => '*',
  }
}
