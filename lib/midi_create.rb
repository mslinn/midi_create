require 'colorator'

# Require all Ruby files in 'lib/', except this file
Dir[File.join("#{__dir__}/midi_create", '*.rb')].sort.each do |file|
  require file
end

MidiCreate.main
