default[:instance] = {}
default[:instance]['id'] = node["opsworks"]["instance"]["id"]
default[:instance]['stack_id'] = node["opsworks"]["stack"]["id"]
default[:instance]['backend_app_id_stage'] = '77357f70-5f0f-4737-9df0-1d51857f5d98'
default[:instance]['frontend_app_id_stage'] = '8aac1be5-0d09-40f9-90e3-10fdcfba1a43'
default[:instance]['backend_app_id_production'] = '1c882f62-c5ab-4b5c-9553-beb0f32d309e'
default[:instance]['frontend_app_id_production'] = '71b066c4-d65f-4a1d-b009-cf914f4d1f61'