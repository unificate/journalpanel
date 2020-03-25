module Micromanage
  class Engine < ::Rails::Engine
    isolate_namespace Micromanage

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
