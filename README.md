# `Midi_create` [![Gem Version](https://badge.fury.io/rb/midi_create.svg)](https://badge.fury.io/rb/midi_create)

Creates a format 1 (multitrack) MIDI file with one track, defaulting to 120 BPM.
The generated MIDI file will contain 8 notes in the C major scale, starting at middle C.
Pro Tools and Ableton Live will not import a MIDI file unless it contains at least one note.


## About Middle C

In Pro Tools and Ableton Live, middle C is known as C3.
[See a discussion about middle C](https://stackoverflow.com/a/69182634/553865),
[and this article](https://studiocode.dev/resources/midi-middle-c/).


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
$ midi_create -h
midi_create: Creates a MIDI file containing an 8-note scale in the key of C,
             starting at middle C (C3 in Pro Tools and Ableton Live).

Syntax: midi_create [Options] PATH_TO_MIDI_FILE

Options:
  -b 120   Specify beats per minute (BPM); default is 120 bpm.
           Only integers can be used; a decimal point will cause an error.
  -f       Overwrite the output file if present
  -t NAME  Use this title for the track
  -h       Show this help message
```


## Sample Usage

Create a MIDI type 1 file called `filename.mid` with one track in the current directory, without a title.
Fail if the file already exists.
Include an 8-note scale in the key of C starting at middle C (C3).

```shell
$ midi_create filename.mid
```


Like the previous example, but overwrite `filename.mid` if it already exists.

```shell
$ midi_create -f filename.mid
```


Like the previous example, plus include the title `Test MIDI clip` for the track.
Ableton Live and Pro Tools ignore the MIDI track title, but Guitar Pro uses it.

```shell
$ midi_create -ft 'Test MIDI clip' filename.mid
```


Like the previous example, plus set BPM to 150.
BPM can only be specified as an integer; using a decimal point will cause an error.

```shell
$ midi_create -b 150 -ft 'Test MIDI clip' filename.mid
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
