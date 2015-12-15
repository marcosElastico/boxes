#
# default.pp
#
node default {

  class { 'php':
    port_http            => '$http',
    port_https           => '$https',
    destination_path     => '$folder',
  }
 
}