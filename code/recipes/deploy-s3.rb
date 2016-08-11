script 'create_dir' do
    interpreter 'bash'
    cwd "/home"
    code <<-EOH
    mkdir -p /home/ec2-user/code/#{node[:deploy]['layer']}_frontend/public
EOH

end

script 'clone_code' do
    interpreter 'bash'
    cwd "/home/ec2-user/code/#{node[:deploy]['layer']}_frontend/public"
    code <<-EOH
aws s3 cp s3://vinelab-code/#{node[:deploy]['layer']}_frontend/#{node[:deploy]['env']}.zip #{node[:deploy]['env']}.zip
EOH

end

script 'unzip_code' do
    interpreter 'bash'
    cwd "/home/ec2-user/code/#{node[:deploy]['layer']}_frontend/public"
    code <<-EOH
    sudo unzip #{node[:deploy]['env']}.zip
EOH

end

script 'remove_archive' do
    interpreter 'bash'
    cwd "/home/ec2-user/code/#{node[:deploy]['layer']}_frontend/public"
    code <<-EOH
    sudo rm #{node[:deploy]['env']}.zip
EOH

end
