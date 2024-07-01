# coding: utf-8

Gem::Specification.new do |s|
  s.name         = 'easy-box-packer-plus'
  s.version      = '0.0.1'
  s.author       = 'Marcelo Alarcon'
  s.email        = 'marceloalarconbarrenechea@gmail.com'
  s.homepage     = 'https://github.com/alChaCC/easy-box-packer'
  s.license      = 'MIT'
  s.summary      = '3D bin-packing with weight limit using first-fit decreasing algorithm and empty maximal spaces'
  s.files        = Dir['LICENSE.txt', 'README.md', 'easy-box-packer.rb']
  s.require_path = '.'
  s.add_development_dependency 'rspec', '~> 3.1', '>= 3.1.0'
  s.add_development_dependency 'pry'
end
