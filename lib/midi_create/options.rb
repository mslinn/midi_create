require 'colorator'
require 'optparse'

VERBOSITY = %w[trace debug verbose info warning error fatal panic quiet].freeze

def help(msg = nil)
  printf "Error: #{msg}\n\n".yellow unless msg.nil?
  msg = <<~END_HELP
    midi_create: Creates an empty MIDI file.

    Syntax: midi_create [Options] PATH_TO_MIDI_FILE

    Options:
      -f Overwrite output file if present
      -h Show this help message
      -v Verbosity; one of: #{VERBOSITY.join ', '}
  END_HELP
  printf msg.cyan
  exit 1
end

def parse_options
  options = { overwrite: false, loglevel: 'warning', verbose: 'info' }
  OptionParser.new do |parser|
    parser.program_name = File.basename __FILE__
    @parser = parser

    parser.on('-f', '--overwrite', 'Overwrite output MIDI file if present')
    parser.on('-l', '--loglevel LOGLEVEL', Integer, "Logging level (#{VERBOSITY.join ', '})")
    parser.on('-v', '--verbose VERBOSE', 'Verbosity')

    parser.on_tail('-h', '--help', 'Show this message') do
      help
    end
  end.order!(into: options)
  help "Invalid verbosity value (#{options[:verbose]}), must be one of one of: #{VERBOSITY.join ', '}." if options[:verbose] && !options[:verbose] in VERBOSITY
  options
end
