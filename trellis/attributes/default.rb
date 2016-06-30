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
default[:instance]['backend_app_id'] = node["backend_app_id"]
default[:instance]['frontend_app_id'] =node["frontend_app_id"]