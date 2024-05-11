class ApplicationController < ActionController::API
    # Cookiesを読み込む
    include ActionController::Cookies

    def hello
        # レスポンスにCookieを設定
        cookies[:hello] = {
          value: "hello",
          expires: 90.day.from_now,
          path: '/',
          httponly: true,
          secure: true
        }

        render plain: "hello world !!"
    end
end
