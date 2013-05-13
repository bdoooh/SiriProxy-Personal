require 'cora'
require 'siri_objects'
require 'pp'
require 'rubygems'
require 'net/ssh'

#######
# This is a "hello world" style plugin. It simply intercepts the phrase "test siri proxy" and responds
# with a message about the proxy being up and running (along with a couple other core features). This
# is good base code for other plugins.
#
# Remember to add other plugins to the "config.yml" file if you create them!
######

class SiriProxy::Plugin::Personal < SiriProxy::Plugin
  def initialize(config)
    #if you have custom configuration options, process them here!
  end

  listen_for /is my plug-in working/i do
    say "Yes, sir"
  end

  listen_for /restart the atv/i do
    say "Restarting the AppleTV, sir"
    @hostname = "192.168.1.3"
    @username = "root"
    @password = "alpine"
    @cmd = "reboot"

    ssh = Net::SSH.start(@hostname, @username, :password => @password)
    res = ssh.exec!(@cmd)
    ssh.close
    puts res
  end
end
