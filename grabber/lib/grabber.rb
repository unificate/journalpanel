require "grabber/engine"

module Grabber
  # define a tables variable for the modules metaclass (metamodule?)
  class << self
    mattr_accessor :tables
  end

  # define a method to allow the host app to configure the engine
  # i.e. assign "tables"
  def self.setup
    yield self
  end
end
