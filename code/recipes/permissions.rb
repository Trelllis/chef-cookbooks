node[:deploy].each do |application, deploy|

    # Only for php projects (Laravel specifically)
    if ::File.directory?("#{deploy[:deploy_to]}/storage")
        script "open_storage_directory" do
            interpreter "bash"
            user 'root'
            cwd deploy[:deploy_to]
            code "chmod -R o+w storage"
        end
    end

    if ::File.directory?("#{deploy[:deploy_to]}/bootstrap")
        script "open_bootstrap_directory" do
            interpreter "bash"
            user 'root'
            cwd deploy[:deploy_to]
            code "chmod -R o+w bootstrap"
        end
    end

end
