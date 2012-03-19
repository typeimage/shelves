#!/usr/bin/env rake
require 'bundler/gem_tasks'
require 'sprockets'
require 'sprockets-sass'
require 'sass'
require 'compass'

desc 'Generate shelves.css'
task :generate do
  Compass.configuration do |compass|
    compass.output_style  = :compact
    compass.line_comments = false
  end
  
  env = Sprockets::Environment.new
  env.append_path 'scss'
  
  shelves = env['shelves/grid.css']
  
  File.open 'css/shelves.css', 'w' do |f|
    f.write shelves.to_s
  end
end
