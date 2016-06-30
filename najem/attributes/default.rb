default[:instance] = {}
default[:instance]['id'] = node["opsworks"]["instance"]["id"]
default[:instance]['stack_id'] = node["opsworks"]["stack"]["id"]
default[:instance]['frontend_app_id'] =node["opsworks"]["frontend_app_id"]