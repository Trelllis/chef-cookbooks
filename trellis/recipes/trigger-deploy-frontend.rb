#Chef::Log.info("app-id [#{node[:instance]['backend_app_id']}]")
#Chef::Log.info("stack-id [#{node[:instance]['stack_id']}]")
#Chef::Log.info("app-id [#{node[:instance]['id']}]")
bash 'Deploy-App' do
    code <<-EOH
        aws opsworks --region us-east-1 create-deployment --instance-ids %Q[#{node[:instance]['stack_id']}]%Q --stack-id [#{node[:instance]['stack_id']}] --app-id [#{node[:instance]['stack_id']}]
EOH

end
