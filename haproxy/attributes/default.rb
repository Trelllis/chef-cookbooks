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
default[:instance]['instance_type'] = node["opsworks"]["instance"]["instance_type"]
default[:instance]['stack_id'] = node["opsworks"]["stack"]["id"]
default[:instance]['backend_app_id'] = node["backend_app_id"]
default[:instance]['frontend_app_id'] =node["frontend_app_id"]