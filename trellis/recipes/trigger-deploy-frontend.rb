log 'message' do
    message 'app-id #{node[:instance]["backend_app_id"]}'
    level :info
end
#bash 'Deploy-App' do
#    code <<-EOH
#        aws opsworks --region us-east-1 create-deployment --instance-ids "#{node[:instance]['id']}" --stack-id #{node[:instance]['stack_id']} --app-id #{node[:instance]['backend_app_id']}
#EOH

#end
