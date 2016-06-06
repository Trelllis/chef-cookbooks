instance_opsworks_id = node["opsworks"]["instance"]["id"]
stack_id = node["opsworks"]["stack"]["id"]
app_id = "77357f70-5f0f-4737-9df0-1d51857f5d98"

    
    bash 'Deploy-App' do
        code <<-EOH
            aws opsworks --region us-east-1 create-deployment --instance-ids "#{instance-opsworks-id}" --stack-id #{stack-id} --app-id #{app-id} --command "{\"Name\":\"deploy\"}"
        EOH

    end
