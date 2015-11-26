include_recipe 'composer'

node[:deploy].each do |application, deploy|

    if File.exists?("#{deploy[:deploy_to]}/composer.json")
        # it's a PHP project
        composer_project deploy[:deploy_to] do
            dev false
            quiet true
            prefer_dist true
            action :install
        end

    elsif File.exists?("#{deploy[:deploy_to]}/package.json")
       # it's a NodeJS/Frontend project
       # template "#{deploy[:deploy_to]}/docker-compose.yml" do
       #      source 'frontend-compose.yml.erb'
       # end
    end
end
