default['monitor']['pagerduty_api_key'] = ''

default['monitor']['graphite_address'] = nil
default['monitor']['graphite_port'] = nil

default['monitor']['hipchat_notifications'] = [
  {
    username: 'Sensu',
    room: 'eComm - DevOps Team'
  },
  {
    username: 'Sensu',
    room: 'eComm - Frontend Dev Team'
  }
]
default['monitor']['hipchat_token'] = 'qs44ZwTOb3G1r5y7xFguSHS2CQy6aZVf2N8e4G00'
