lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'her/version'

version     = Her::VERSION
version_tag = "v#{Her::VERSION}"

desc 'Generate index.html with documentation using Rocco'
task :rocco do
  require 'rocco'
  File.open('index.html', 'w') { |f| f.write(Rocco.new('bin/her').to_html) }
end

desc "Build her-#{version}.gem"
task :build => :rocco do
  system "gem build her.gemspec"
end

desc "Build and install her-#{version}.gem into system gems"
task :install => :build do
  system "gem install -f *.gem"
end

desc "Create tag #{version_tag} and build and push her-#{version}.gem to Rubygems"
task :release => :build do
  if sh('git tag').split(/\n/).include?(version_tag)
    raise("This tag has already been committed to the repo.")
  else
    sh "git tag -a -m \"Version #{version}\" #{version_tag}"
  end
  system "gem push *.gem"
end

desc "Clean up"
task :clean do
  system "rm -f *.gem"
end

desc "Count lines of code"
task :wc do
  system 'awk "/__END__/{print c;exit}/^ *[^#]+/{c+=1}" bin/her'
end
