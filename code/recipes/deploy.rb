include_recipe 'deploy'

node[:deploy].each do |application, deploy|
    # Setup deployment directory
    opsworks_deploy_dir do
        user deploy[:user]
        group deploy[:group]
        path deploy[:deploy_to]
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
        content "#!/bin/sh\nexec /usr/bin/ssh -i /tmp/id_rsa \"$@\""
    end

    # Deploy code
    deploy deploy[:deploy_to] do
        keep_releases deploy[:keep_releases]
        repository deploy[:scm][:repository]
        user deploy[:user]
        group deploy[:group]
        revision deploy[:scm][:revision]
        environment deploy[:environment].to_hash
        action deploy[:action]
        ssh_wrapper "/tmp/git_wrapper.sh"
    end
end
