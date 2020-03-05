Micromanage.setup do |config|
  # a list to store which tables the engine should service
  config.tables =
    ["customers",
     "items",
     "purchases"]
end
