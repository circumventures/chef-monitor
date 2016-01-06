#
# Cookbook Name:: monitor
# Recipe:: _hipchat_handler
#
# Copyright 2016, Circumventures, LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

sensu_gem 'hipchat'
sensu_gem 'timeout'

cookbook_file '/etc/sensu/handlers/hipchat.rb' do
  source 'handlers/hipchat.rb'
  mode 0755
end

sensu_snippet 'hipchat' do
  content(api_key: node['monitor']['hipchat_api_key'])
end

template '/etc/sensu/handlers/hipchat.json' do
  source 'hipchat.json.erb'
  mode 0600
  owner node['sensu']['user']
  group node['sensu']['group']
  variables(
    apikey: node['monitor']['hipchat_api_key'],
    apiversion: node['monitor']['hipchat_api_ver'],
    hipchatroom: node['monitor']['hipchat_room'],
    hipchatfrom: node['monitor']['hipchat_from']
  )
end

include_recipe 'monitor::_filters'

sensu_handler 'hipchat' do
  type 'pipe'
  command 'hipchat.rb'
  filters ['actions']
end
