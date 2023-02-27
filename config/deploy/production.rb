server '18.178.208.13', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/home/taku/.ssh/id_rsa'