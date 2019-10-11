#!/usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

exit_code = 0

Dir.glob('**/*.png').each do |filename|
  next if filename[/^vendor\//]

  image_size = ImageSize.path(filename)
  if image_size.format != :png
    puts "#{filename} isn't in PNG format"
    exit_code = 1
  end
  if image_size.width > 512
    puts "#{filename} is wider than 512px"
    exit_code = 1
  end
  if image_size.height > 512
    puts "#{filename} is taller than 512px"
    exit_code = 1
  end
  if File.size(filename) > 20_480
    puts "#{filename} is larger than 20KB"
    exit_code = 1
  end
end

Dir.glob("*").each do |dirname|
  next unless File.directory?(dirname)
  next if File.basename(dirname) == "bin"

  unless File.exist?("#{dirname}/logo.png")
    puts "#{dirname} doesn't contain a logo.png"
    exit_code = 1
  end
end

exit exit_code
