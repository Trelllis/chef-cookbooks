#Trigger Frontend Deployement

command = '"{\"Name\":\"deploy\"}"'

script 'Deploy-App' do
    interpreter 'bash'
    code <<-EOH
aws opsworks --region us-east-1 create-deployment --instance-ids \"#{node[:instance]['id']}\" --stack-id #{node[:instance]['stack_id']} --app-id d34f90e5-b022-4d1d-a7b1-d02bebce289c --command #{command}
EOH

end

