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
default[:instance]['backend_app_id'] = '8aac1be5-0d09-40f9-90e3-10fdcfba1a43'
