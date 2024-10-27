require_relative 'lib/midi_create/version'

Gem::Specification.new do |spec|
  host = 'https://github.com/mslinn/midi_create'

  spec.authors               = ['Mike Slinn']
  spec.bindir                = 'exe'
  spec.executables           = %w[midi_create]
  spec.description           = <<~END_DESC
    Write a longer description of the gem.
    Use as many lines as you like.
  END_DESC
  spec.email                 = ['mslinn@mslinn.com']
  spec.files                 = Dir['.rubocop.yml', 'LICENSE.*', 'Rakefile', '{lib,spec}/**/*', '*.gemspec', '*.md']
  spec.homepage              = 'https://mslinn.com/av_studio/705-midi-create.html'
  spec.license               = 'MIT'
  spec.metadata = {
    'allowed_push_host' => 'https://rubygems.org',
    'bug_tracker_uri'   => "#{host}/issues",
    'changelog_uri'     => "#{host}/CHANGELOG.md",
    'homepage_uri'      => spec.homepage,
    'source_code_uri'   => host,
  }
  spec.name                 = 'midi_create'
  spec.post_install_message = <<~END_MESSAGE

    Thanks for installing #{spec.name}!

  END_MESSAGE
  spec.require_paths         = ['lib']
  spec.required_ruby_version = '>= 2.6.0'
  spec.summary               = 'Creates an empty MIDI file'
  spec.version               = MidiCreate::VERSION

  spec.add_dependency 'colorator'
  spec.add_dependency 'midilib'
  spec.add_dependency 'optparse'
end
