script 'Deploy-App' do
    interpreter 'bash'
    code <<-EOH
aws opsworks --region us-east-1 create-deployment --instance-ids \"[#{node[:instance]['id']}]\" --stack-id [#{node[:instance]['stack_id']}] --app-id [#{node[:instance]['frontend_app_id']}] --command \"{\\\"Name\\\":\\\"deploy\\\"}\"
EOH

end
