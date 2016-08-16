include_recipe 'deploy'

node[:deploy].each do |application, deploy|
    directory deploy[:deploy_to] do
        owner deploy[:user]
        group deploy[:group]
        mode '0755'
        recursive true
        action :create
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
    script 'clone_code' do
        interpreter 'bash'
        cwd 'deploy #{application}'
        code <<-EOH
    aws s3 cp s3://vinelab-code/#{application}/#{node[:deploy]['env']}.zip #{node[:deploy]['env']}.zip
EOH
    end

    script 'unzip_code' do
        interpreter 'bash'
        cwd 'deploy #{application}'
        code <<-EOH
        sudo unzip #{node[:deploy]['NODE_ENV']}.zip
EOH

    end

    script 'remove_archive' do
        interpreter 'bash'
        cwd "/home/ec2-user/code/#{node[:deploy]['layer']}_frontend/public"
        code <<-EOH
        sudo rm #{node[:deploy]['NODE_ENV']}.zip
EOH

    end

#    s3_file "deploy #{application}" do
#        remote_path "/najem_frontend/stage.zip"
#        bucket "vinelab-code"
#        aws_access_key_id deploy["scm"]["user"]
#        aws_secret_access_key deploy["scm"]["password"]
#        s3_url deploy[:scm][:repository]
#        owner deploy[:user]
#        group deploy[:group]
#        action :create
#    end
    
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
end