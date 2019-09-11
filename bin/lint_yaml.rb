#!/usr/bin/env ruby

require 'yaml'

exit_code = 0

Dir.glob('**/*.yaml').each do |filename|
  begin
    YAML.load_file(filename)
  rescue Psych::SyntaxError => e
    puts e.message
    exit_code = 1
  end
end

exit exit_code
