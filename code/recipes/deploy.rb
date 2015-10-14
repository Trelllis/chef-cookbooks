include_recipe 'deploy'

node[:deploy].each do |application, deploy|
    opsworks_deploy_dir do
        user deploy[:user]
        group deploy[:group]
        path deploy[:deploy_to]
    end

    opsworks_deploy do
        app application
        deploy_data deploy
        ssh_key deploy[:scm][:ssh_key]
    end
end
