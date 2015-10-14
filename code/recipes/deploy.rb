include_recipe 'deploy'

node[:deploy].each do |application, deploy|
    # Setup deployment directory
    # opsworks_deploy_dir do
    #     user deploy[:user]
    #     group deploy[:group]
    #     path deploy[:deploy_to]
    # end

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

    # Deploy code
    git "deploy #{application}" do
        destination deploy[:deploy_to]
        repository deploy[:scm][:repository]
        user deploy[:user]
        group deploy[:group]
        revision deploy[:scm][:revision]
        ssh_wrapper "/tmp/git_wrapper.sh"
        action :sync
    end
end
