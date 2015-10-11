include_recipe 'deploy'

node[:deploy].each do |application, deploy|
    opsworks_deploy_dir do
        user code[:user]
        group code[:group]
        path "#{code[:location]}/#{application}"
    end

    opsworks_deploy do
        app application
        deploy_data deploy
    end
end
