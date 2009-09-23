require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

gem 'jeweler', '~> 1.2.1'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "timecop"
    s.rubyforge_project = 'johntrupiano' # if different than lowercase project name
    s.description = %q(A gem providing "time travel" and "time freezing" capabilities, making it dead simple to test time-dependent code.  It provides a unified method to mock Time.now, Date.today, and DateTime.now in a single call. This fork uses cache files. Different processes can use time cop. It is meant to be used with Culerity.)
    s.summary = s.description # More details later??
    s.email = "zan@liangzan.net"
    s.homepage = "http://github.com/jtrupiano/timecop"
    s.authors = ["John Trupiano", "Wong Liang Zan"]
    s.files =  FileList["[A-Z]*", "{bin,lib,test}/**/*"]
  end
  Jeweler::RubyforgeTasks.new do |rubyforge|
    rubyforge.doc_task = "rdoc"
    rubyforge.remote_doc_path = "timecop"
  end
rescue LoadError
  puts "Jeweler, or one of its dependencies, is not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

Dir['tasks/**/*.rake'].each do |rake|
  begin
    load rake
  rescue LoadError
  end
end



