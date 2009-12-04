Gem::Specification.new do |s|
 
  # This gem’s name. Required.
  s.name = 'speedy'
 
  # This gem’s version. Required.
  s.version = '0.1.0'
 
  # The date this gem was created. Required. Default = `Time.now`
  #s.date = '2009-11-15'
  
  # A short summary of this gem’s description. Displayed in `gem list -d`. Required.
  s.summary = "Speedy is a Rapid Rails deplyement utility for ModRails"
 
  # A long description of this gem
  #s.description = <<-EOF
  # Foo Bar
  #EOF
 
  # The list of authors who wrote this gem
  # s.authors = %w( Mohamed Aslam )
  
  # Singular accessor for authors
  s.author = 'Mohamed Aslam'
 
  # The URL of this gem’s home page
  s.homepage = 'http://speedy.mohamedaslam.com'
 
  # A contact email for this gem
  s.email = 'aslam@weblivestudio.com'
 
  # The path in the gem for executable scripts. Default = 'bin'
  s.bindir = 'bin'
 
  # Executables included in the gem
  s.executables = ['speedy']
 
  # Extra files to add to RDoc
  s.extra_rdoc_files = ['doc']
  
  # Files included in this gem. You cannot append to this accessor, you must assign to it.
  # Only add files you can require to this list, not directories, etc.
  # Directories are automatically stripped from this list when building a gem, other non-files cause an error.
  s.files = Dir['lib/**/*.rb'] + Dir['bin/*']
 
  # The target platform for the gem. Required. Default = Gem::Platform::Ruby
  #s.platform = nil
  
  # List of "require" paths from the root of the gem. Required. Default = ['lib']
  #s.require_paths = ['lib']
  
  # Lists the gems that must be installed for this gem to work. Default = []
  #s.add_dependency 'name', '>= 0.1.0'
 
end