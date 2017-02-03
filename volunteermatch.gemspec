# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vm_public_api/version'

Gem::Specification.new do |spec|
  spec.name          = "volunteermatch"
  spec.version       = Volunteermatch::VERSION
  spec.authors       = ["Evan Ng"]
  spec.email         = ["evan.ng@outlook.com"]

  spec.summary       = %q{A Ruby wrapper for VolunteerMatch's Public-Use API.}
  spec.description   = %q{A lightweight Ruby wrapper that queries VolunteerMatch's Public-Use API for searching information on nonprofit organizations and active volunteering opportunities.}
  spec.homepage      = "https://github.com/evanscloud/vm_public_api"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end