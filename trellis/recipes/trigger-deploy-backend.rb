#Trigger Backend Deployement

command = '"{\"Name\":\"deploy\"}"'

script 'Deploy-App' do
    interpreter 'bash'
    code <<-EOH
aws opsworks --region us-east-1 create-deployment --instance-ids \"#{node[:instance]['id']}\" --stack-id #{node[:instance]['stack_id']} --app-id #{node[:instance]['trellis_backend_app_id']} --command #{command}
EOH

end
