include_recipe 'monitor::default'
sensu_gem 'ohai'

### Checks

node['openssh']['server']['port'].each do |port|
  sensu_check 'ssh' + port do
    # file '/system/check-disk.rb'
    command 'check-banner.rb -p ' + port
    handlers ['default']
    interval node['monitor']['default_interval']
    subscribers ['base']
    additional(
      handle_when: {
        occurrences: node['monitor']['default_occurrences'],
        reset: 2_592_000
      }
    )
  end
end

sensu_check 'disk_usage' do
  # file '/system/check-disk.rb'
  command 'check-disk-usage.rb -w 95 -c 99 -x nfs,tmpfs,fuse -p /run/lxcfs'
  handlers ['default']
  interval node['monitor']['default_interval']
  subscribers ['base']
  additional(
    handle_when: {
      occurrences: node['monitor']['default_occurrences'],
      reset: 2_592_000
    }
  )
end

sensu_check 'memory' do
  # file '/system/check-mem.rb'
  command 'check-memory-percent.rb -w 70 -c 80'
  handlers ['default']
  interval node['monitor']['default_interval']
  subscribers ['base']
  additional(
    handle_when: {
      occurrences: node['monitor']['default_occurrences'],
      reset: 2_592_000
    }
  )
end

sensu_check 'swap' do
  # file '/system/check-mem.rb'
  command 'check-swap-percent.rb -w 70 -c 80'
  handlers ['default']
  interval node['monitor']['default_interval']
  subscribers ['base']
  additional(
    handle_when: {
      occurrences: node['monitor']['default_occurrences'],
      reset: 2_592_000
    }
  )
end

sensu_check 'load' do
  # file '/system/check-load.rb'
  command 'check-load.rb -w 10,15,25 -c 15,20,30'
  handlers ['default']
  interval node['monitor']['default_interval']
  subscribers ['base']
  additional(
    handle_when: {
      occurrences: node['monitor']['default_occurrences'],
      reset: 2_592_000
    }
  )
end

sensu_check 'fs_writeable_tmp' do
  command 'check-fs-writable.rb -d /tmp'
  handlers ['default']
  interval node['monitor']['default_interval']
  subscribers ['base']
  additional(
    handle_when: {
      occurrences: node['monitor']['default_occurrences'],
      reset: 2_592_000
    }
  )
end

### Metrics

#sensu_check 'load_metrics' do
#  type 'metric'
#  command 'metrics-load.rb --scheme :::scheme_prefix::::::name:::.load'
#  handlers ['metrics']
#  interval node['monitor']['metric_interval']
#  subscribers ['base']
#  additional(
#    occurrences: node['monitor']['metric_occurrences']
#  )
#  not_if { node['monitor']['use_system_profile'] }
#end

#sensu_check 'cpu_metrics' do
#  type 'metric'
#  command 'metrics-cpu.rb --scheme :::scheme_prefix::::::name:::.cpu'
#  handlers ['metrics']
#  interval node['monitor']['metric_interval']
#  subscribers ['base']
#  additional(
#    occurrences: node['monitor']['metric_occurrences']
#  )
#  not_if { node['monitor']['use_system_profile'] }
#end

#sensu_check 'memory_metrics' do
#  type 'metric'
#  command 'metrics-memory.rb --scheme :::scheme_prefix::::::name:::.memory'
#  handlers ['metrics']
#  interval node['monitor']['metric_interval']
#  subscribers ['base']
#  additional(
#    occurrences: node['monitor']['metric_occurrences']
#  )
#  not_if { node['monitor']['use_system_profile'] }
#end

#sensu_check 'interface_metrics' do
#  type 'metric'
#  command 'metrics-interface.rb --scheme :::scheme_prefix::::::name:::.interface'
#  handlers ['metrics']
#  interval node['monitor']['metric_interval']
#  subscribers ['base']
#  additional(
#    occurrences: node['monitor']['metric_occurrences']
#  )
#  not_if { node['monitor']['use_system_profile'] }
#end

#sensu_check 'disk_metrics' do
#  type 'metric'
#  command 'metrics-disk.rb --scheme :::scheme_prefix::::::name:::.disk'
#  handlers ['metrics']
#  interval node['monitor']['metric_interval']
#  subscribers ['base']
#  additional(
#    occurrences: node['monitor']['metric_occurrences']
#  )
#  not_if { node['monitor']['use_system_profile'] }
#end

#sensu_check 'disk_usage_metrics' do
#  type 'metric'
#  command 'metrics-disk-usage.rb -l --scheme :::scheme_prefix::::::name:::.disk_usage'
#  handlers ['metrics']
#  interval node['monitor']['metric_interval']
#  subscribers ['base']
#  additional(
#    occurrences: node['monitor']['metric_occurrences']
#  )
#end
