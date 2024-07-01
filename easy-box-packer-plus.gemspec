# coding: utf-8

Gem::Specification.new do |s|
  s.name         = 'easy-box-packer-plus'
  s.version      = '0.0.3'
  s.author       = 'Marcelo Alarcon'
  s.email        = 'marceloalarconbarrenechea@gmail.com'
  s.homepage     = 'https://github.com/chelobotix/easy-box-packer-plus'
  s.license      = 'MIT'
  s.summary      = '3D bin-packing with weight limit using first-fit decreasing algorithm. The functionality has been extended to include an internal options hash, allowing any desired values to be passed to the items, such as IDs and labels for each item. This ensures that when the gem returns the result, these keys are included in the output.'
  s.files        = Dir['LICENSE', 'README.md', 'easy-box-packer-plus.rb']
  s.require_path = '.'
  s.add_development_dependency 'rspec', '~> 3.1', '>= 3.1.0'
  s.add_development_dependency 'pry'
end
