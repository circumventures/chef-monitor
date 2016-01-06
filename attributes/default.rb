override['sensu']['use_embedded_ruby'] = true
override['sensu']['version'] = '0.21.0-2'
override['sensu']['use_ssl'] = true
override['sensu']['rabbitmq'] = {
  'user' => 'sensurmq',
  'password' => 'S3cur3SENrmqpA55!'
}

# This should be discovered by Chef search
default['monitor']['master_address'] = nil

default['monitor']['environment_aware_search'] = false
default['monitor']['use_local_ipv4'] = true

default['monitor']['additional_client_attributes'] = Mash.new

default['monitor']['use_nagios_plugins'] = false
default['monitor']['use_system_profile'] = false
default['monitor']['use_statsd_input'] = false

default['monitor']['sudo_commands'] = []

default['monitor']['default_handlers'] = ['debug']
default['monitor']['metric_handlers'] = ['debug']

default['monitor']['client_extension_dir'] = '/etc/sensu/extensions/client'
default['monitor']['server_extension_dir'] = '/etc/sensu/extensions/server'
