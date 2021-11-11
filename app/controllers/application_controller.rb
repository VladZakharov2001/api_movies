class ApplicationController < ActionController::API
    def current_user
        User.find_by(username: "vlad")
    end
end
