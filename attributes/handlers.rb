default['monitor']['pagerduty'] = {
  'service_key' => 'biguglystringgoinhereyadig',
  'timeout' => 10
}

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
  'icon_url' => 'http://www.gravatar.com/avatar/9b37917076cee4e2d331a785f3426640',
  'payload_template' => {
    'attachments' =>
    {
      'fallback' => '<%= @event["check"]["output"] %>',
      'color' => '<%= color %>',
      'title' => '<%= @event["check"]["name"] %> (<%= @event["client"]["name"] %>)',
      'text' => '<%= @event["check"]["output"].gsub(\'"\', \'\\"\') %>'
    }
  }
}
