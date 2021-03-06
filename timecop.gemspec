# Generated by jeweler
# DO NOT EDIT THIS FILE
# Instead, edit Jeweler::Tasks in Rakefile, and run `rake gemspec`
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{timecop}
  s.version = "0.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["John Trupiano", "Wong Liang Zan"]
  s.date = %q{2009-09-23}
  s.description = %q{A gem providing "time travel" and "time freezing" capabilities, making it dead simple to test time-dependent code.  It provides a unified method to mock Time.now, Date.today, and DateTime.now in a single call. This fork uses cache files. Different processes can use time cop. It is meant to be used with Culerity.}
  s.email = %q{zan@liangzan.net}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    "History.txt",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION.yml",
     "lib/timecop.rb",
     "lib/timecop/stack_item.rb",
     "lib/timecop/time_extensions.rb",
     "lib/timecop/timecop.rb",
     "test/run_tests.sh",
     "test/test_helper.rb",
     "test/test_timecop.rb",
     "test/test_timecop_internals.rb",
     "test/test_timecop_without_date.rb"
  ]
  s.homepage = %q{http://github.com/jtrupiano/timecop}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{johntrupiano}
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{A gem providing "time travel" and "time freezing" capabilities, making it dead simple to test time-dependent code.  It provides a unified method to mock Time.now, Date.today, and DateTime.now in a single call. This fork uses cache files. Different processes can use time cop. It is meant to be used with Culerity.}
  s.test_files = [
    "test/test_timecop_internals.rb",
     "test/test_timecop.rb",
     "test/test_timecop_without_date.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
