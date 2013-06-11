require "socket"
require_relative "alchoholic_bot"

server = "chat.freenode.net"
port = "6667"
nick = "AlchoholicBot"
channel = "#bitmakerlabs"
greeting_prefix = "PRIVMSG #bitmakerlabs :"
greetings = ["hello", "hi", "hola", "yo", "wazup", "guten tag", "howdy", "salutations", 
             "who the hell are you?", "How are you?", "wassup?"]

# opens a new socket with the correct port and server
s = TCPSocket.open(server, port)

# print("addr: ", s.addr.join(":"), "\n")
# print("peer: ", s.peeraddr.join(":"), "\n")

s.puts "USER AlchoholicBot 0 * AlchoholicBot"
s.puts "NICK #{nick}"
s.puts "JOIN #{channel}"
s.puts "PRIVMSG #{channel} :Another drink here please!"

bot = AlchoholicBot.new 
wasGreeted = false
until s.eof? do
  msg = s.gets
  puts msg

  greetings.each do |greeting|
    if msg.include? greeting
      wasGreeted = true 
      puts "The greeting was recognized."
    end
  end

  if msg.include? greeting_prefix and wasGreeted
    response = bot.talk(msg)
    s.puts "PRIVMSG #{channel} :#{response}"
  end
end

# as a person
# Set up Nickname -> /NICK [USERNAME]
# Join -> /JOIN #bitmaker