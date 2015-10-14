node[:deploy].each do |application, deploy|
  script "open_storage_directory" do
    interpreter "bash"
    user deploy[:user]
    cwd deploy[:deploy_to]
    code "chmod -R o+w storage"
  end
end
