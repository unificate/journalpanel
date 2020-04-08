require 'json'
module EditpageHelper
    def stringToJSON(string)
        return JSON.parse(string)
    end

end
