node[:deploy].each do |application, deploy|

    if File.exists?("#{deploy[:deploy_to]}/composer.json")

        composer_auth_path = "#{deploy[:deploy_to]}/composer-github-oauth.json"

        template composer_auth_path do
            source 'composer-auth.json.erb'

            variables(
                github_oauth_token: deploy[:environment_variables]['GITHUB_OAUTH_TOKEN'],
            )
        end

        template "#{deploy[:deploy_to]}/docker-compose.yml" do
            source 'backend-compose.yml.erb'

            variables(
                code_path: deploy[:deploy_to],
                auth_path: composer_auth_path,
            )
        end

        script "build-#{application}" do
            interpreter 'bash'
            cwd deploy[:deploy_to]
            code <<-EOH
                docker-compose run --rm backend
            EOH
        end

    elsif File.exists?("#{deploy[:deploy_to]}/package.json")
       # it's a NodeJS/Frontend project
       template "#{deploy[:deploy_to]}/docker-compose.yml" do
            source 'frontend-compose.yml.erb'

            variables(
                code_path: deploy[:deploy_to],
                env: deploy[:environment_variables]['NODE_ENV'],
            )
        end

        script 'build-frontend' do
            interpreter 'bash'
            cwd deploy[:deploy_to]
            code <<-EOH
                docker-compose run --rm frontend
            EOH
        end
    end
end
