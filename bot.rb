require "cinch"

bot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.freenode.net"
    c.channels = ["#sinatra"]
    c.nick = "bcart3r"
  end
  
  on :message, /^(.+)/ do |m|
    File.open("log.txt", "a") do |f|
      f.write "#{m.user}: #{m.message} (#{Time.now.asctime}) \n"
    end
  end
end
