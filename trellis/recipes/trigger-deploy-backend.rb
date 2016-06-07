 bash 'Deploy-App' do
        code <<-EOH
            aws opsworks --region us-east-1 create-deployment --instance-ids "#{node[:opsworks][:instance][:id]}" --stack-id #{node[:opsworks][:stack][:id]} --app-id 77357f70-5f0f-4737-9df0-1d51857f5d98 --command "{"Name":"deploy"}"
        EOH

    end

