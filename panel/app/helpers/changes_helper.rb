require 'json'
module ChangesHelper
  def stringToJSON(string)
    return JSON.parse(string)
  end

end
