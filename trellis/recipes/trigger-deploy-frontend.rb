instance_opsworks_id = node["opsworks"]["instance"]["id"]
stack_id = node["opsworks"]["stack"]["id"]
app_id = "8aac1be5-0d09-40f9-90e3-10fdcfba1a43"

    
    bash 'Deploy-App' do
        code <<-EOH
            aws opsworks --region us-east-1 create-deployment --instance-ids "#{instance-opsworks-id}" --stack-id #{stack-id} --app-id #{app-id} --command "{\"Name\":\"deploy\"}"
        EOH

    end
