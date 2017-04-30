include_recipe '../secret/username_and_password.rb'

target_directory = "/home/#{$username}/.ssh"
target_path      = "#{target_directory}/authorized_keys"

directory target_directory
remote_file target_path do
  owner "#{$username}"
  group "#{$username}"
  source "../secret/authorized_keys"
end

# root (temporary)
target_directory = "/root/.ssh"
target_path      = "#{target_directory}/authorized_keys"

directory target_directory
remote_file target_path do
  owner "root"
  group "root"
  source "../secret/authorized_keys"
end
