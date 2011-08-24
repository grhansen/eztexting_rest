require 'rubygems'  
require 'rake'  
require 'echoe'  
require 'yard'
  
Echoe.new('eztexting_rest', '0.1.1') do |p|  
  p.description     = "Access The New EzTexting REST APIs"  
  p.url             = "http://github.com/EzTexting/eztexting_rest"  
  p.author          = "David Malin"  
  p.email           = "dmalin@eztexting.com"  
  p.ignore_pattern  = ["tmp/*", "script/*"]  
  p.development_dependencies = []  
  p.runtime_dependencies = ["curb >=0.7.15", "nokogiri >=1.5.0", "active_support >=2.3.5"]
end  

YARD::Rake::YardocTask.new do |t|
  t.files   = ['lib/**/*.rb']   # optional
  t.options = ['--any', '--extra', '--opts'] # optional
end

  
Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }