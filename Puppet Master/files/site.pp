# Add your node list with the clases and parameters for the modules that should be installed in each one.
# A MongoDB's nodes sample:

# node /^mongodb-/ {
#   class { 'mongodb':
#     version => $mongodb_version,
#     username => $mongo_username,
#     password => $mongo_password,
#   }
# }
