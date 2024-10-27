require 'colorator'

# Require all Ruby files in 'lib/', except this file
Dir[File.join("#{__dir__}/midi_create", '*.rb')].each do |file|
  # puts "Require #{file}"
  require file
end

MidiCreate.main
