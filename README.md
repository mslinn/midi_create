# `Midi_create` [![Gem Version](https://badge.fury.io/rb/midi_create.svg)](https://badge.fury.io/rb/midi_create)

Creates an empty MIDI file with one track at 120 BPM.


## Installation

Type this at a shell prompt:

```shell
$ gem install midi_create
```


## Sample Usage

```shell
$ midi_create filename.mid
```


### Help Message

```text
midi_create: Creates an empty MIDI file.

Syntax: midi_create [Options] PATH_TO_MIDI_FILE

Options:
  -f Overwrite output file if present
  -h Show this help message
  -v Verbosity; one of: trace, debug, verbose, info, warning, error, fatal, panic, quiet
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
