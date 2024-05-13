class UsersController < ApplicationController
  def create
    # サービスを実行
    res = User::CreateUserService.call(create_params)

    # 実行結果によりレスポンスを設定
    if res
      render json: res, status: :created
    else
      render json: { message: "会員登録ができませんでした。" }, status: :internal_server_error
    end
  end

  def get_user
    # パスパラメータの取得
    uid = params[:uid]

    # サービスを実行
    user = User::GetAUserService.call(uid)
    
    # レスポンス設定
    render json: user
  end

  def update
    # パスパラメータの取得
    uid = params[:uid]

    # サービスを実行
    res = User::UpdateUserService.call(update_params, uid)

    # 実行結果によりレスポンスを設定
    if res
      render json: res
    else
      render json: { message: "会員情報の更新ができませんでした。" }, status: :internal_server_error
    end
  end

  def delete
    # パスパラメータの取得
    uid = params[:uid]

    # サービスを実行
    res = User::DeleteUserService.call(uid)

    # 実行結果によりレスポンスを設定
    if res
      render json: { message: "OK" }, status: :ok
    else
      render json: { message: "退会処理ができませんでした。" }, status: :internal_server_error
    end
  end

  def get_users_with_discarded
    # サービスを実行
    users = User::GetUsersWithDiscardedService.call()
    
    # レスポンス設定
    render json: users
  end

  private
    # ストロングパラメータ
    def create_params
      params.require(:user).permit(:uid, :last_name, :first_name, :email)
    end

    def update_params
      params.require(:user).permit(:last_name, :first_name, :email)
    end
end
