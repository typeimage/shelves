#!/usr/bin/env rake
require 'bundler/gem_tasks'

task :default => :generate

desc 'Generate shelves.css'
task :generate do
  require 'sprockets'
  require 'sprockets-sass'
  require 'sass'
  require 'compass'

  Compass.configuration do |compass|
    compass.output_style  = :compact
    compass.line_comments = false
  end

  env = Sprockets::Environment.new
  env.append_path 'scss'

  File.open 'css/shelves.css', 'w' do |f|
    f.write env['shelves-grid.css'].to_s
  end
end
