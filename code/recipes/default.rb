include_recipe 'deploy'

node[:deploy].each do |application, deploy|
    Chef::Log.debug(">>>> Deploying application #{application}")

    opsworks_deploy_dir do
        user deploy[:user]
        group deploy[:group]
        path deploy[:deploy_to]
    end

    opsworks_deploy do
        app application
        deploy_data deploy
    end
    Chef::Log.debug(">>>> Deployment of application #{application} complete.")
end
