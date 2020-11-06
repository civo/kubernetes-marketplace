#!/usr/bin/env ruby

require 'yaml'

exit_code = 0

Dir.glob('**/*.yaml').each do |filename|
  next unless filename[/manifest\.yaml$/]

  begin
    yaml = YAML.load_file(filename)
    yaml["dependencies"].each do |dependency|
      dependency, plan = dependency.split(":")
      unless File.exist?("#{dependency.downcase}/manifest.yaml")
        puts "#{filename} has a dependency on \"#{dependency}\" but that application doesn't exist"
        exit_code = 1
      end
      if plan != nil
        begin
          yaml = YAML.load_file("#{dependency.downcase}/manifest.yaml")
          unless yaml["plans"].detect {|p| p["label"] == plan}
            puts "#{filename} has a dependency on a \"#{plan}\" plan on \"#{dependency}\" but that plan doesn't exist in #{dependency}"
            exit_code = 1
          end
        rescue Psych::SyntaxError
        end
      end
    end
  rescue
  end
end

exit exit_code
