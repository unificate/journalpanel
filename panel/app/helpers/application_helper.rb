module ApplicationHelper
    # To display svg's in app (Used for logo atm)
    def show_svg(path)
      File.open("app/assets/images/#{path}", "rb") do |file|
        raw file.read
      end
    end

    def checkRole
        if current_user
            case current_user.role
                when "Admin"
                    return 4
                when "Release Manager"
                    return 3
                when "Product Owner"
                    return 2
                when "Developer"
                    return 1
                else
                    return 0
            end
        end
        return 0
    end
end
