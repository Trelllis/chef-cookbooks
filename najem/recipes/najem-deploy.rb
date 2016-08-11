script 'clone_code' do
    interpreter 'bash'
    cwd "/home/ec2-user/code/najem_frontend/public"
    code <<-EOH
    aws s3 cp s3://vinelab-code/najem_frontend/stage.zip stage.zip
EOH

end

script 'unzip_code' do
    interpreter 'bash'
    cwd "/home/ec2-user/code/najem_frontend/public"
    code <<-EOH
    sudo unzip stage.zip
EOH

end

script 'remove_archive' do
    interpreter 'bash'
    cwd "/home/ec2-user/code/najem_frontend/public"
    code <<-EOH
    sudo rm stage.zip
EOH

end