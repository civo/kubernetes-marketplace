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

    if matches = yaml["description"].scan(/(best|award[- ]winning|leading|greatest|super)/)
      if matches.any?
        puts "#{filename} has salesy terms in the description - #{matches.flatten.join(", ")}"
        exit_code = 2
      end
    end
  end
end

exit exit_code
