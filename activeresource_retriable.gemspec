Gem::Specification.new do |s|
  s.name = %q{activeresource_retriable}
  s.version = "0.0.0"
  s.summary = %q{Add a retry mechanism to ActiveResource}
  s.authors = %w(Amr M)

  s.files = Dir.glob("{lib}/**/*") + %w(README.md)
  s.require_paths = ["lib"]

  s.add_dependency('activeresource', '~> 5.0')
  s.add_dependency('retriable', '~> 3.1')
end

