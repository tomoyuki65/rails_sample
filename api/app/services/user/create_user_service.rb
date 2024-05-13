class User::CreateUserService

  def self.call(...)
    new(...).call
  end

  def initialize(params)
    @params = params
  end
  
  def call
    @user = User.new(@params)

    # トランザクション
    ActiveRecord::Base.transaction do
      # 一時保存
      @user.save!

      # 会員IDの設定（9桁）
      @member_id = 100000000 + @user.id
      @user.member_id = @member_id
      @user.save!
    end

    # 戻り値
    @user

  rescue => e
    nil
  end
end