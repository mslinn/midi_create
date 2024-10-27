require 'midilib'

module MidiCreate
  include MIDI

  def self.main
    @options = parse_options
    help 'MIDI file name must be provided.' if ARGV.empty?
    help "Too many parameters specified.\n#{ARGV}" if ARGV.length > 1

    @midi_out = ARGV[0]
    if File.exist?(@midi_out)
      if @options[:overwrite]
        File.delete(@midi_out)
      else
        help "Error: File '#{@midi_out}' already exists and -f was not specified."
      end
    end
    create
  end

  def self.create
    # Create a new empty MIDI sequence.
    seq = MIDI::Sequence.new

    # Create a first track for the sequence. This holds tempo events and stuff like that.
    track = Track.new(seq)
    seq.tracks << track
    track.events << Tempo.new(Tempo.bpm_to_mpq(120))
    track.events << MetaEvent.new(META_SEQ_NAME, 'This sequence was created by midi_create')

    # Create a track to hold the notes. Add it to the sequence.
    track = Track.new(seq)
    seq.tracks << track

    # Write the sequence to a MIDI file.
    File.open(@midi_out, 'wb') { |file| seq.write(file) }
  end
end
