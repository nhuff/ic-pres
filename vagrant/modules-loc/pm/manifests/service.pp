class pm::service {
  service {'puppetmaster':
    ensure => 'running',
    enable => true,
  }
}
