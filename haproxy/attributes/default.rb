#General Attributes
default[:instance] = {}
default[:instance]['instance_id'] = node['opsworks']['instance']['aws_instance_id']
default[:instance]['private_ip'] = node['opsworks']['instance']['private_ip']

#haproxy server specific attributes
default[:haproxy][:check_interval] = '10s'
default[:haproxy][:client_timeout] = '60s'
default[:haproxy][:server_timeout] = '60s'
default[:haproxy][:queue_timeout] = '120s'
default[:haproxy][:connect_timeout] = '10s'
default[:haproxy][:http_request_timeout] = '30s'
default[:haproxy][:global_max_connections] = '80000'
default[:haproxy][:default_max_connections] = '80000'
default[:haproxy][:retries] = '3'
default[:haproxy][:httpclose] = true
default[:haproxy][:http_server_close] = false
default[:haproxy][:stats_socket_path] = '/tmp/haproxy.sock'

#haproxy api specific attributes
default[:haproxyapi] = {}
default[:haproxyapi]['private_ip'] = node['haproxy_ip']
default[:haproxyapi]['backend'] = node['backend']

#haproxy opsworks related attributes
default[:instance]['id'] = node["opsworks"]["instance"]["id"]
default[:instance]['stack_id'] = node["opsworks"]["stack"]["id"]
default[:instance]['backend_app_id_stage'] = '77357f70-5f0f-4737-9df0-1d51857f5d98'
default[:instance]['frontend_app_id_stage'] = '8aac1be5-0d09-40f9-90e3-10fdcfba1a43'
default[:instance]['backend_app_id_production'] = '1c882f62-c5ab-4b5c-9553-beb0f32d309e'
default[:instance]['frontend_app_id_production'] = '71b066c4-d65f-4a1d-b009-cf914f4d1f61'
