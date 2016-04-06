default['monitor']['pagerduty_api_key'] = ''

default['monitor']['graphite_address'] = nil
default['monitor']['graphite_port'] = nil

default['monitor']['hipchat'] = {
  'hipchat_api_key' => 'gigglegigglelol2uomg',
  'hipchat_room' => '123456'
}

default['monitor']['slack'] = {
  'webhook_url' => 'https://hooks.slack.com/services/OMGSUX2U/THISISABIGRANDOMSTRING',
  'username' => 'sensu',
  'channel' => '#sensu',
  'timeout' => 10,
  'icon_url' => 'http://www.gravatar.com/avatar/9b37917076cee4e2d331a785f3426640'
}
