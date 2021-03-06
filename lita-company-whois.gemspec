Gem::Specification.new do |spec|
  spec.name          = "lita-company-whois"
  spec.version       = "0.1.0"
  spec.authors       = ["Eduardo Nunes"]
  spec.email         = ["eduardo@kollegorna.se"]
  spec.description   = "Lita handler for running an whois on any company by URL"
  spec.summary       = "Lita handler for running an whois on any company by URL"
  spec.homepage      = "https://github.com/emmnunes/lita-company-whois"
  spec.license       = "MIT License"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4.3"
  spec.add_runtime_dependency "clearbit"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "clearbit"
  spec.add_development_dependency "rspec", ">= 3.0.0"
end
