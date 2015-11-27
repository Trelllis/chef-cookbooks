node[:deploy].each do |application, deploy|
    if File.exists?("#{deploy[:deploy_to]}/.env.example")
        template "#{deploy[:deploy_to]}/.env" do
            source ".env.erb"
            mode 0444
            owner deploy[:user]
            group deploy[:group]

            variables(
                variables: (deploy[:environment_variables] rescue {}),
            )

            only_if { ::File.directory?("#{deploy[:deploy_to]}") }
        end
    end
end
