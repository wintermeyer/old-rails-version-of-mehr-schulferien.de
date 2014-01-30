# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
MehrSchulferienDe::Application.initialize!

# Create ENV['RAILS_CACHE_ID'] which is added automagically 
# to all etags and fragment cache keys.
#
ENV['RAILS_CACHE_ID'] = `git log --pretty=format:%h -n1`.strip