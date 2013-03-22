#!/usr/bin/env ruby
class Hello
  def self.say(name)
    puts "Hello #{name}"
  end
end

if __FILE__ == $0
  Hello.say(ARGV[0] || $stdin.readline)
end

