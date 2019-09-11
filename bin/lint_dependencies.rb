#!/usr/bin/env ruby

require 'yaml'

exit_code = 0

Dir.glob('**/*.yaml').each do |filename|
  next unless filename[/manifest\.yaml$/]

  begin
    yaml = YAML.load_file(filename)
    yaml["dependencies"].each do |dependency|
      unless File.exist?("#{dependency.downcase}/manifest.yaml")
        puts "#{filename} has a dependency on \"#{dependency}\" but that application doesn't exist"
        exit_code = 1
      end
    end
  rescue
  end
end

exit exit_code
