class User::UpdateUserService

  def self.call(...)
    new(...).call
  end

  def initialize(params, uid)
    @params = params
    @uid = uid
  end
  
  def call
    @user = User.where(uid: @uid).first

    # トランザクション
    ActiveRecord::Base.transaction do
      @user.update!(@params)
    end

    # 戻り値
    @user

  rescue => e
    nil
  end
end