Gem::Specification.new do |spec|
  spec.name = %q{simple-datatable}
  spec.version = "0.0.2"
  spec.date = %q{2019-11-24}
  spec.summary = %q{awesome_gem is the best datatable Rails Gem}
  spec.authors       = ["DevTeam AppTec"]
  spec.email         = ["soporte@apptec.cl"]
  spec.summary       = %q{Datatable Ruby gem for Rails.}
  spec.homepage      = "https://github.com/apptec-cl/simple-datatable"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib', 'templates']
  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'will_paginate', '~> 3.1.0'
end
