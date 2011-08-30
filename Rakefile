require 'rubygems'
require 'rake'
require 'rake/clean'
require 'rubygems/package_task'
require 'rdoc/task'
require 'rake/testtask'
require 'rspec/core/rake_task'
require 'cucumber'
require 'cucumber/rake/task'

spec = Gem::Specification.new do |s|
  s.name = 'pageweight'
  s.version = '0.0.1'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README', 'LICENSE']
  s.summary = 'Get HTTP PageWeight in Ruby'
  s.description = s.summary
  s.author = 'Adebola Oke'
  s.email = 'adesmail.100@gmail.com'
  s.files = %w(LICENSE README Rakefile) + Dir.glob("{bin,lib,spec}/**/*")
  s.require_path = "lib"
  s.bindir = "bin"
  s.add_dependency('nokogiri')
end

Gem::PackageTask.new(spec) do |p|
  p.gem_spec = spec
  p.need_tar = true
  p.need_zip = true
end

Rake::RDocTask.new do |rdoc|
  files =['README', 'LICENSE', 'lib/**/*.rb']
  rdoc.rdoc_files.add(files)
  rdoc.main = "README" # page to start on
  rdoc.title = "page_weight Docs"
  rdoc.rdoc_dir = 'doc/rdoc' # rdoc output folder
  rdoc.options << '--line-numbers'
end

RSpec::Core::RakeTask.new do |t|
  t.ruby_opts = "-I lib"
end

Cucumber::Rake::Task.new do |t|
  t.cucumber_opts = "--format pretty -q"
end

task :push => :gem do |t|
  sh "gem push pkg/#{spec.name}-#{spec.version}.gem"
end