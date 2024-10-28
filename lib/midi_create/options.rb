require 'colorator'
require 'optparse'

def help(msg = nil)
  printf "Error: #{msg}\n\n".yellow unless msg.nil?
  msg = <<~END_HELP
    midi_create: Creates an empty MIDI file.

    Syntax: midi_create [Options] PATH_TO_MIDI_FILE

    Options:
      -f Overwrite output file if present
      -n Generate notes
      -h Show this help message
  END_HELP
  printf msg.cyan
  exit 1
end

def parse_options
  options = { overwrite: false }
  OptionParser.new do |parser|
    parser.program_name = File.basename __FILE__
    @parser = parser

    parser.on(     '-f', '--overwrite', 'Overwrite output MIDI file if present')
    parser.on(     '-n', '--notes',     'Generate notes')
    parser.on_tail('-h', '--help',      'Show this message') do
      help
    end
  end.order!(into: options)
  options
end
