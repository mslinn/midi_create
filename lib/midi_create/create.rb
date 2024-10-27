require 'midilib'

module MidiCreate
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
