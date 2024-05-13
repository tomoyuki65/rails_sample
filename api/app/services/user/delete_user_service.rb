class User::DeleteUserService

  def self.call(...)
    new(...).call
  end
  
  def initialize(uid)
    @uid = uid
  end
    
  def call
    ActiveRecord::Base.transaction do
      @user = User.where(uid: @uid).first
      @user.discard!
    end
 
    # 戻り値
    @user

  rescue => e
    nil
  end
end