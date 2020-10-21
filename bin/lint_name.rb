#!/usr/bin/env ruby

require 'yaml'

exit_code = 0

Dir.glob('**/*.yaml').each do |filename|
  next unless filename[/manifest\.yaml$/]

  begin
    yaml = YAML.load_file(filename)
    name = yaml["name"].split(":").first

    if name[/\s/]
      puts "#{filename} has a space in its name, if required put the space version in a 'title' attribute"
      exit_code = 1
    end
  rescue
  end
end

exit exit_code
