#!/usr/bin/env ruby

require 'yaml'

exit_code = 0

Dir.glob('**/*.yaml').each do |filename|
  next unless filename[/manifest\.yaml$/]

  begin
    yaml = YAML.load_file(filename)
    unless yaml["version"].is_a? String
      puts "#{filename} has a non-string version field"
      exit_code = 1
    end
  end
end

exit exit_code
