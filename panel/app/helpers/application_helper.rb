module ApplicationHelper
    # To display svg's in app (Used for logo atm)
    def show_svg(path)
      File.open("app/assets/images/#{path}", "rb") do |file|
        raw file.read
      end
    end
end
