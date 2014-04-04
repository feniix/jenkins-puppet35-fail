node default {

  include java7

  class { 'jenkins':
    install_java  => false,
    config_hash   => {
      'JAVA_ARGS' => {
        'value'   =>
          '-Djava.awt.headless=true -Djava.net.preferIPv4Stack=false -Xmx1024m'
      },
    }
  }

  package { 'mc':
    ensure => present,
  }
}
