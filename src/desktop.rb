require 'listen'
require_relative 'imports'
require_relative 'zredc'

$VERBOSE = nil

$configuration = LwjglApplicationConfiguration.new
$configuration.title = 'JRuby demo'

$configuration.x = 0
$configuration.y = 0
$configuration.width = 700
$configuration.height = 400
$configuration.resizable = false

puts 'starting listener...'
listener = Listen.to('.', only: /\.rb/) do |modified, added, removed|
  puts "modified: #{modified}"
  if modified != []
    if modified != nil
      puts "file modified: #{modified}"
    end
  end
end
listener.start # not blocking
puts 'listener initialized'


module Desktop
  def self.launch
    $gg = MainGame.new
    begin
      LwjglApplication.new($gg, $configuration)
    rescue Exception => e
      pa "exception in desktop Lwjgl init: #{e}", :red, :bright
      e.backtrace.each {|ll| pa "    #{ll}", :red}
    end
  end
end

Desktop.launch
