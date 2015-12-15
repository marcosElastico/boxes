#
# default.pp
#
node default {
  stage { 'init': before => Stage['main'] }
 
  class { 'rabbitmq':
    port         => '$rabbitmq',
    ssl_port     => '$ssl_port',
    key_path     => '$SERVER_KEY_PATH',
    cert_path    => '$SERVER_CERT_PATH',
    ca_cert_path => '$CA_CERT_PATH',
    mnesia_base  => '$MNESIA_BASE',
    log_base     => '$LOG_BASE',
    user_name    => '$username',
    password     => '$password',
    version      => '$VERSION',
    stage        => 'init'
  }
 
  rabbitmq::plugin { 'rabbitmq_management':
    ensure  => present,
    require => Class['rabbitmq']
  }

#if ($username != '')

  rabbitmq_user { '$username':
    ensure   => present,
    admin    => true,
    password => '$password',
    require  => Class['rabbitmq']
  }
 
  rabbitmq_user_permissions { '$username':
    configure_permission => '.*',
    read_permission      => '.*',
    write_permission     => '.*',
    require              => Rabbitmq_user['$username'],
  }
    #if ($username != 'guest')
   
  rabbitmq_user { 'guest':
    ensure  => absent,
    require => Class['rabbitmq']
  }
    #end
#end
 
}