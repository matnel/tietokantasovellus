# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
FancyAppStore::Application.initialize!

## use external libs
config.gem "carrierwave"
