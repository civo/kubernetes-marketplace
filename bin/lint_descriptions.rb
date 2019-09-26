#!/usr/bin/env ruby

require 'yaml'

exit_code = 0

Dir.glob('**/*.yaml').each do |filename|
  next unless filename[/manifest\.yaml$/]

  begin
    yaml = YAML.load_file(filename)
    if yaml["description"].length > 160
      puts "#{filename} has too a long description (#{yaml["description"].length} chars, 160 max)"
      exit_code = 1
    end
  end
end

exit exit_code
