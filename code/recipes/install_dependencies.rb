include_recipe 'composer'

node[:deploy].each do |application, deploy|
    composer_project "#{code[:location]}/#{application}" do
        dev false
        quiet true
        prefer_dist true
        action :install
    end
end
