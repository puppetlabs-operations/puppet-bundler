puppet-bundler
==============

Automatically install ruby dependencies.

Dependencies
------------

- The [`ruby` module](https://github.com/puppetlabs/puppetlabs-ruby) has to be installed alongside this module.

Examples
--------

    bundler::install { $app_root:
      user       => $app_user,
      group      => $app_group,
      deployment => true,
      without    => 'development test doc',
    }
