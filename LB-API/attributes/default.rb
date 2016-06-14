default[:instance] = {}
default[:instance]['id'] = node['opsworks']['instance']['aws_instance_id']
default[:instance]['private_ip'] = node['opsworks']['instance']['private_ip']
default[:haproxy] = {}
default[:haproxy]['stage_ip'] = '10.0.7.211'
default[:haproxy]['production_ip'] = '192.168.9.53'