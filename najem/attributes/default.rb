default[:instance] = {}
default[:instance]['id'] = node["opsworks"]["instance"]["id"]
default[:instance]['stack_id'] = node["opsworks"]["stack"]["id"]
default[:instance]['trellis_backend_app_id'] = node["trellis_backend_app_id"]
default[:instance]['najem_frontend_app_id'] =node["najem_frontend_app_id"]
default[:instance]['trellis_frontend_app_id'] =node["trellis_frontend_app_id"]