# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "toto"
  s.version = "0.4.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["cloudhead"]
  s.date = "2012-10-23"
  s.description = "the tiniest blog-engine in Oz."
  s.email = "self@cloudhead.net"
  s.extra_rdoc_files = [
    "LICENSE",
    "README.md",
    "TODO"
  ]
  s.files = [
    ".document",
    "LICENSE",
    "README.md",
    "Rakefile",
    "TODO",
    "VERSION",
    "lib/ext/ext.rb",
    "lib/toto/article.rb",
    "lib/toto.rb",
    "test/articles/1900-05-17-the-wonderful-wizard-of-oz.txt",
    "test/articles/2001-01-01-two-thousand-and-one.txt",
    "test/articles/2009-04-01-tilt-factor.txt",
    "test/articles/2009-12-04-some-random-article.txt",
    "test/articles/2009-12-11-the-dichotomy-of-design.txt",
    "test/autotest.rb",
    "test/templates/about.rhtml",
    "test/templates/archives.rhtml",
    "test/templates/article.rhtml",
    "test/templates/feed.builder",
    "test/templates/index.builder",
    "test/templates/index.rhtml",
    "test/templates/layout.rhtml",
    "test/templates/repo.rhtml",
    "test/test_helper.rb",
    "test/toto_test.rb",
    "toto.gemspec"
  ]
  s.homepage = "http://github.com/cloudhead/toto"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "the tiniest blog-engine in Oz"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<riot>, [">= 0"])
      s.add_runtime_dependency(%q<builder>, [">= 0"])
      s.add_runtime_dependency(%q<rack>, [">= 0"])
      s.add_runtime_dependency(%q<rdiscount>, [">= 0"])
    else
      s.add_dependency(%q<riot>, [">= 0"])
      s.add_dependency(%q<builder>, [">= 0"])
      s.add_dependency(%q<rack>, [">= 0"])
      s.add_dependency(%q<rdiscount>, [">= 0"])
    end
  else
    s.add_dependency(%q<riot>, [">= 0"])
    s.add_dependency(%q<builder>, [">= 0"])
    s.add_dependency(%q<rack>, [">= 0"])
    s.add_dependency(%q<rdiscount>, [">= 0"])
  end
end

