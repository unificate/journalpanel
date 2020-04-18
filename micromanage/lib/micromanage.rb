require "micromanage/engine"

module Micromanage
  # define a tables variable for the module's metaclass (metamodule?)
  # the host application should initialize :tables as an array of
  # table names that will be exposed by the API
  # this is done in the host application in /config/initializers/micromanage.rb
  class << self
    mattr_accessor :tables
  end

  # define a method to allow the host app to configure the engine
  # i.e. assign "tables"
  def self.setup
    yield self
  end
end
