# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{eztexting_rest}
  s.version = "0.1.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{David Malin}]
  s.date = %q{2011-08-25}
  s.description = %q{Access The New EzTexting REST APIs}
  s.email = %q{dmalin@eztexting.com}
  s.extra_rdoc_files = [%q{LICENSE}, %q{README.textile}, %q{lib/eztexting_rest.rb}, %q{lib/eztexting_rest/base.rb}, %q{lib/eztexting_rest/credits.rb}, %q{lib/eztexting_rest/keywords.rb}, %q{lib/eztexting_rest/lookup.rb}, %q{lib/eztexting_rest/sms.rb}, %q{lib/eztexting_rest/voice.rb}]
  s.files = [%q{LICENSE}, %q{Manifest}, %q{README.textile}, %q{RELEASE_NOTES}, %q{Rakefile}, %q{VERSION}, %q{examples/example_script.rb}, %q{lib/eztexting_rest.rb}, %q{lib/eztexting_rest/base.rb}, %q{lib/eztexting_rest/credits.rb}, %q{lib/eztexting_rest/keywords.rb}, %q{lib/eztexting_rest/lookup.rb}, %q{lib/eztexting_rest/sms.rb}, %q{lib/eztexting_rest/voice.rb}, %q{eztexting_rest.gemspec}]
  s.homepage = %q{http://github.com/EzTexting/eztexting_rest}
  s.rdoc_options = [%q{--line-numbers}, %q{--inline-source}, %q{--title}, %q{Eztexting_rest}, %q{--main}, %q{README.textile}]
  s.require_paths = [%q{lib}]
  s.rubyforge_project = %q{eztexting_rest}
  s.rubygems_version = %q{1.8.8}
  s.summary = %q{Access The New EzTexting REST APIs}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<curb>, [">= 0.7.15"])
      s.add_runtime_dependency(%q<nokogiri>, [">= 1.5.0"])
      s.add_runtime_dependency(%q<active_support>, [">= 2.3.5"])
    else
      s.add_dependency(%q<curb>, [">= 0.7.15"])
      s.add_dependency(%q<nokogiri>, [">= 1.5.0"])
      s.add_dependency(%q<active_support>, [">= 2.3.5"])
    end
  else
    s.add_dependency(%q<curb>, [">= 0.7.15"])
    s.add_dependency(%q<nokogiri>, [">= 1.5.0"])
    s.add_dependency(%q<active_support>, [">= 2.3.5"])
  end
end
