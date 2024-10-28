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

    # Create a first track for the sequence. This holds tempo events and other data.
    track = Track.new(seq)
    seq.tracks << track
    track.events << Tempo.new(Tempo.bpm_to_mpq(@options[:bpm]))
    track.events << MetaEvent.new(META_SEQ_NAME, @options[:title]) if @options[:title]

    # Create a track to hold the notes. Add it to the sequence.
    track = Track.new(seq)
    seq.tracks << track

    if @options[:notes]
      # Add events to the track: a major scale. Arguments for note on and note off
      # constructors are channel, note, velocity, and delta_time. Channel numbers
      # start at zero. We use the new Sequence#note_to_delta method to get the
      # delta time length of a single quarter note.
      track.events << ProgramChange.new(0, 1, 0)
      quarter_note_length = seq.note_to_delta('quarter')
      c4 = 60 # There is probably a more elegant way of specifying middle C (C4)
      [0, 2, 4, 5, 7, 9, 11, 12].each do |offset|
        track.events << NoteOn.new(0, c4 + offset, 127, 0)
        track.events << NoteOff.new(0, c4 + offset, 127, quarter_note_length)
      end
    end

    # Write the sequence to a MIDI file.
    File.open(@midi_out, 'wb') { |file| seq.write(file) }
  end
end
