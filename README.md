# `Midi_create` [![Gem Version](https://badge.fury.io/rb/midi_create.svg)](https://badge.fury.io/rb/midi_create)

Creates a format 1 (multitrack) MIDI file with one track at 120 BPM.
By default the MIDI file has no notes, however using the `-n` option will cause a major scale to be included.


## Installation

Set up Ruby [(here is how)](https://www.mslinn.com/ruby/1000-ruby-setup.html),
then type the following at a shell prompt:

```shell
$ gem install midi_create
```

If you are running `rbenv` (and you should, according to the instructions mentioned above), type:

```shell
$ rbenv rehash
```


## Help Message

```text
midi_create: Creates an empty MIDI file.

Syntax: midi_create [Options] PATH_TO_MIDI_FILE

Options:
  -b 120   Specify beats per minute (BPM); default is 120 bpm
  -f Overwrite output file if present
  -h Show this help message
  -n Generate notes
  -t Generate title
```


## Sample Usage

Create a MIDI type 1 file called `filename.mid` with one track in the current directory without any notes or title.
Fail if the file already exists.

```shell
$ midi_create filename.mid
```


Like the previous example, but overwrite `filename.mid` if it already exists.

```shell
$ midi_create -f filename.mid
```

Like the previous example, plus generate an 8-note scale in the key of C starting at middle C.
In Pro Tools and Ableton Live, middle C is known as C3.
[See a discussion about middle C](https://stackoverflow.com/a/69182634/553865),
[and this article](https://studiocode.dev/resources/midi-middle-c/).

```shell
$ midi_create -fn filename.mid
```


Like the previous example, plus include the title `Test MIDI clip` for the track.
Ableton Live ignores the MIDI track title.

```shell
$ midi_create -fnt 'Test MIDI clip' filename.mid
```


Like the previous example, plus set BPM to 150.
BPM can only be specified as an integer; using a decimal point will cause an error.

```shell
$ midi_create -b 150 -fnt 'Test MIDI clip' filename.mid
```


## Development

After checking out this git repository, install dependencies by typing:

```shell
$ bin/setup
```

You should do the above before running Visual Studio Code.


### Run the Tests

```shell
$ bundle exec rake test
```


### Interactive Session

The following will allow you to experiment:

```shell
$ bin/console
```


### Local Installation

To install this gem onto your local machine, type:

```shell
$ bundle exec rake install
```


### To Release A New Version

To create a git tag for the new version, push git commits and tags,
and push the new version of the gem to https://rubygems.org, type:

```shell
$ bundle exec rake release
```


## Contributing

Bug reports and pull requests are welcome at https://github.com/mslinn/midi_create.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
