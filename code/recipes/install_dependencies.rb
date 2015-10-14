include_recipe 'composer'

node[:deploy].each do |application, deploy|
    composer_project deploy[:deploy_to] do
        dev false
        quiet true
        prefer_dist true
        action :install
    end
end
