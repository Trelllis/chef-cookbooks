include_recipe 'composer'

node[:deploy].each do |application, deploy|
    composer_project "#{deploy[:deploy_to]}/current" do
        dev false
        quiet true
        prefer_dist true
        action :install
    end
end
