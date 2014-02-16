# Define the weekend days
#
WEEKEND_WDAYS = [6,0]


# Create ENV['RAILS_CACHE_ID'] which is added automagically 
# to all etags and fragment cache keys.
#
ENV['RAILS_APP_VERSION'] = `git log --pretty=format:%h -n1`.strip