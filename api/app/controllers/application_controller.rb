class ApplicationController < ActionController::API
    def hello
        render plain: "hello world !!"
    end
end
