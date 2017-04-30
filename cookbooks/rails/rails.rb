package "gcc" do
  action :install
end

package "build-essential" do
  action :install
end

package "libssl-dev" do
  action :install
end

package "libreadline-dev" do
  action :install
end

package "zlib1g-dev" do
  action :install
end

# package "sqlite3" do
#   action :install
# end

package "libsqlite3-dev" do
  action :install
end

package "nodejs" do
  action :install
end
