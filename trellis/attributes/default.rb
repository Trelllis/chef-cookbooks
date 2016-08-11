default[:hosts] = {}
default[:hosts]['neo4j'] = ''
default[:hosts]['redis'] = {}
default[:hosts]['redis']['redis-primary-data'] = ''
default[:hosts]['redis']['redis-primary-media'] = ''
default[:hosts]['redis']['redis-primary-cache'] = ''
default[:hosts]['redis']['redis-replica-media'] = ''
default[:hosts]['redis']['redis-replica-data'] = ''
default[:hosts]['redis']['redis-replica-cache'] = ''

default[:instance] = {}
default[:instance]['id'] = node["opsworks"]["instance"]["id"]
default[:instance]['stack_id'] = node["opsworks"]["stack"]["id"]
default[:instance]['trellis_backend_app_id'] = node["trellis_backend_app_id"]
default[:instance]['najem_frontend_app_id'] =node["najem_frontend_app_id"]
default[:instance]['trellis_frontend_app_id'] =node["trellis_frontend_app_id"]
default[:deploy]['env']=node['env']
default[:deploy]['layer']=node['backend']
