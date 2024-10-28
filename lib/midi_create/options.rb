require 'colorator'
require 'optparse'

def help(msg = nil)
  printf "Error: #{msg}\n\n".yellow unless msg.nil?
  msg = <<~END_HELP
    midi_create: Creates an empty MIDI file.

    Syntax: midi_create [Options] PATH_TO_MIDI_FILE

    Options:
      -b 120   Specify beats per minute (BPM); default is 120 bpm.
               Only integers can be used; a decimal point will cause an error.
      -f       Overwrite output file if present
      -n       Generate an 8-note scale in the key of C, starting at C4
      -t NAME  Use this title for the track
      -h       Show this help message
  END_HELP
  printf msg.cyan
  exit 1
end

def parse_options
  options = { bpm: 120, overwrite: false }
  OptionParser.new do |parser|
    parser.program_name = File.basename __FILE__
    @parser = parser

    parser.on('-b',      '--bpm BPM', OptionParser::DecimalInteger, 'Specify BPM (default is 120 bpm)')
    parser.on('-f',      '--overwrite',                             'Overwrite output MIDI file if present')
    parser.on('-n',      '--notes',                                 'Generate notes')
    parser.on('-t',      '--title TITLE',                           'Generate title')
    parser.on_tail('-h', '--help',                                  'Show this message') do
      help
    end
  end.order!(into: options)
  options
end
