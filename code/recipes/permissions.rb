node[:deploy].each do |application, deploy|

    script "open_storage_directory" do
        interpreter "bash"
        user 'root'
        cwd deploy[:deploy_to]
        code "chmod -R o+w storage"
    end

    script "open_bootstrap_directory" do
        interpreter "bash"
        user 'root'
        cwd deploy[:deploy_to]
        code "chmod -R o+w bootstrap"
    end

end
