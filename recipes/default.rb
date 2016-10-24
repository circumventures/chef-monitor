#
# Cookbook Name:: monitor
# Recipe:: default
#
# Copyright 2013, Sean Porter Consulting
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

include_recipe 'monitor::_master_search'

include_recipe 'sensu::default'

ip_type = node['monitor']['use_local_ipv4'] ? 'local_ipv4' : 'public_ipv4'

client_attributes = node['monitor']['additional_client_attributes'].to_hash

sensu_client node.name do
  if node.key?('cloud')
    address node['cloud'][ip_type] || node['ipaddress']
  else
    address node['ipaddress']
  end
  subscriptions node['roles'] + ['base']
  additional client_attributes
end

include_recipe 'build-essential::default'

sensu_gem 'sensu-plugins-network-checks' do
  version '1.1.0'
end

sensu_gem 'sensu-plugins-load-checks' do
  version '1.0.0'
end

sensu_gem 'sensu-plugins-cpu-checks' do
  version '1.0.0'
end

sensu_gem 'sensu-plugins-process-checks' do
  version '1.0.0'
end

sensu_gem 'sensu-plugins-memory-checks' do
  version '1.0.2'
end

sensu_gem 'sensu-plugins-disk-checks' do
  version '1.1.2'
end

sensu_gem 'sensu-plugins-filesystem-checks' do
  version '0.2.0'
end

sensu_gem 'sensu-plugins-vmstats' do
  version '0.0.3'
end

sensu_gem 'sensu-plugins-io-checks' do
  version '1.0.0'
end

include_recipe 'monitor::_nagios_plugins' if node['monitor']['use_nagios_plugins']
include_recipe 'monitor::_system_profile' if node['monitor']['use_system_profile']
include_recipe 'monitor::_statsd' if node['monitor']['use_statsd_input']

include_recipe 'sensu::client_service'
