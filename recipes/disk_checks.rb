#
# Cookbook Name:: monitor
# Recipe:: disk_checks
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

include_recipe 'monitor::_disk_checks'

sensu_check 'disk-usage' do
  command 'check-disk-usage.rb -w 90 -c 96'
  handlers ['default']
  interval 60
end
