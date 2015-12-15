#
# default.pp
#
node default {

  class { 'mongodb':
    port     => '$mongodb',
    username => '$username',
    password => '$password',
    version  => '$VERSION',
    db_path  => '$DB_PATH',
    log_path => '$LOG_PATH',
  }
 
}