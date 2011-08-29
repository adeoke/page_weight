spec = Gem::Specification.new do |s|
  s.name = 'PageWeight'
  s.version = '0.0.1'
  s.summary = "Get HTTP PageWeight in Ruby"
  s.description = s.summary
  s.files = Dir['lib/**/*.rb'] + Dir['test/**/*.rb']
  s.require_path = 'lib'
  s.autorequire = 'nokogiri'
  s.has_rdoc = true
  s.extra_rdoc_files = Dir['[A-Z]*']
  s.rdoc_options << '--line-numbers'
  s.author = "Adebola Oke"
  s.email = "adesmail100.gmail.com"
  s.homepage = ""
end