#!/usr/bin/env rake
require 'bundler/gem_tasks'

task :default => :generate

desc 'Generate shelves.css'
task :generate do
  system './bin/shelves > ./css/shelves.css'
end
