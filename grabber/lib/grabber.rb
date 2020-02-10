require "grabber/engine"

module Grabber
  # a list to store which tables the engine should service
  def self.tables
    ["customers",
     "items",
     "purchases"]
  end
end
