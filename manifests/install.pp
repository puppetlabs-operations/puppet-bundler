define bundler::install($gem_bindir = '/var/lib/gems/1.8/bin') {

  require bundler

  exec { "bundle install ${name}" :
    command   => 'bundle install',
    cwd       => $name,
    path      => "/bin:/usr/bin:${gem_bindir}",
    unless    => 'bundle check',
    require   => Package['bundler'],
    logoutput => on_failure,
  }
}
