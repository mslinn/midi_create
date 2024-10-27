require 'midilib'

module MidiCreate
  def self.parse_options
    options = { shake: 5, loglevel: 'warning' }
    OptionParser.new do |parser|
      parser.program_name = File.basename __FILE__
      @parser = parser

      parser.on('-f', '--overwrite', 'Overwrite output file if present')
      parser.on('-l', '--loglevel LOGLEVEL', Integer, "Logging level (#{VERBOSITY.join ', '})")
      parser.on('-s', '--shake SHAKE', Integer, 'Shakiness (1..10)')
      parser.on('-v', '--verbose VERBOSE', 'Zoom percentage')
      parser.on('-z', '--zoom ZOOM', Integer, 'Zoom percentage')

      parser.on_tail('-h', '--help', 'Show this message') do
        help
      end
    end.order!(into: options)
    help "Invalid verbosity value (#{options[:verbose]}), must be one of one of: #{VERBOSITY.join ', '}." if options[:verbose] && !options[:verbose] in VERBOSITY
    help "Invalid shake value (#{options[:shake]})." if options[:shake].negative? || options[:shake] > 10
    options
  end

  def self.main
    @options = parse_options
    help 'MIDI file name must be provided.' if ARGV.empty?
    help "Too many parameters specified.\n#{ARGV}" if ARGV.length > 1

    @midi_out = ARGV[0]
    File.delete(@midi_out) if File.exist?(@midi_out) && @options[:overwrite]
    create
  end

  def self.create
    # Create a new, empty sequence.
    seq = MIDI::Sequence.new

    # Write the sequence to a MIDI file.
    File.open(@midi_out, 'wb') { |file| seq.write(file) }
  end
end
