# = Define: bundler::install
#
# Perform a bundle install in a given directory. Wraps all of the
# fiddly little configuration guts.
#
# == Example
#
#  # Deploy a sinatra app
#  sinatra::app { 'appy':
#    giturl   => 'git://your.git.server/your/git/remote',
#  }
#
#  # And then run bundler
#  bundler::install {'/opt/boardie':
#    require => Sinatra::App['boardie'],
#  }
#
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
