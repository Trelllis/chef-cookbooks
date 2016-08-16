include_recipe 'deploy'
require 'aws-sdk'

node[:deploy].each do |application, deploy|
    directory deploy[:deploy_to] do
        owner deploy[:user]
        group deploy[:group]
        mode '0755'
        recursive true
        action :create
    end

    if deploy[:application_type] != 'php'
        Chef::Log.debug("Skipping deploy::php application #{application} as it is not an PHP app")
        next
    end
    
    # Create id_rsa file - Git SSH Key
    file "/tmp/id_rsa" do
        owner deploy[:user]
        mode "0400"
        content deploy[:scm][:ssh_key]
    end

    # Create SSH wrapper script
    file "/tmp/git_wrapper.sh" do
        owner deploy[:user]
        mode "0755"
        content "#!/bin/bash\n/usr/bin/env ssh -q -2 -o \"StrictHostKeyChecking=no\" -i \"/tmp/id_rsa\" $1 $2"
    end

#    # Deploy code
#    git "deploy #{application}" do
#        destination deploy[:deploy_to]
#        repository deploy[:scm][:repository]
#        user deploy[:user]
#        group deploy[:group]
#        revision deploy[:scm][:revision]
#        ssh_wrapper "/tmp/git_wrapper.sh"
#        action :sync
#    end

    s3_file "/tmp/somefile" do
        remote_path [:deploy_to]
        aws_access_key_id deploy["scm"]["user"]
        aws_secret_access_key deploy["scm"]["password"]
        s3_url deploy[:scm][:repository]
        owner deploy[:user]
        group deploy[:group]
        action :create
    end
    
end
