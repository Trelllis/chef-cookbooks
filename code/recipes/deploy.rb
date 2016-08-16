include_recipe 'deploy'

node[:deploy].each do |application, deploy|
    
    # Check directory to deploy
    directory deploy[:deploy_to] do
        owner deploy[:user]
        group deploy[:group]
        mode '0755'
        recursive true
        action :create
    end

    # App Type git
    if deploy["scm"]["scm_type"] == 'git'
        
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
    
    # App Type S3
    if deploy["scm"]["scm_type"] == 's3'

        # Parse S3 Link
        s3_bucket, s3_key, base_url = OpsWorks::SCM::S3.parse_uri(deploy[:scm][:repository])

        # Copy code from s3
        s3_file "#{deploy[:deploy_to]}/code.zip" do
            bucket s3_bucket
            remote_path s3_key
            aws_access_key_id deploy["scm"]["user"]
            aws_secret_access_key deploy["scm"]["password"]
            s3_url base_url
            owner deploy[:user]
            group deploy[:group]
            action :create
        end

        # Unzip code
        script 'unzip_code' do
            interpreter 'bash'
            cwd deploy[:deploy_to]
            code <<-EOH
            sudo unzip code.zip
EOH

        end

        # Remove archive
        script 'remove_archive' do
            interpreter 'bash'
            cwd deploy[:deploy_to]
            code <<-EOH
            sudo rm code.zip
EOH

        end
        
    end
    
end