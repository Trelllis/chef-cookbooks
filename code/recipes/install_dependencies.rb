include_recipe 'composer'

node[:deploy].each do |application, deploy|
    composer_project "/home/ec2-user/#{application}" do
        dev false
        quiet true
        prefer_dist true
        action :install
    end
end
