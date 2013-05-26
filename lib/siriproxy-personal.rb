require 'cora'
require 'siri_objects'
require 'pp'

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

  listen_for /restart the apple tv/i do
    say "Restarting the AppleTV, sir"
    host = "192.168.1.3"
    username = "root"
    password = "alpine" # assuming all hosts have same user account and password of course
    cmd = "reboot"
    Net::SSH.start( host , username, :password => password) do |ssh|
      puts ssh.exec! cmd
    end
    say "AppleTV is restarting..."
    request_completed
  end

  listen_for /turn corner lamp (on|off)/i do |status|
    if(status == "on")
      system 'echo "rf a1 on" | nc localhost 1099'
      say "Corner lamp is on"
    end
    if(status == "off" )
      system 'echo "rf a1 off" | nc localhost 1099'
      say "Corner lamp is off"
    end
    request_completed
  end

=begin
  listen_for /turn corner lamp off/i do
    system 'echo "rf a1 off" | nc localhost 1099'
    say "Corner lamp is off"
    request_completed
  end 
=end

end
