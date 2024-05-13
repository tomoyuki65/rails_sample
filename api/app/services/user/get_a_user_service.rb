class User::GetAUserService

  def self.call(...)
    new(...).call
  end
  
  def initialize(uid)
    @uid = uid
  end
    
  def call
    @user = User.where(uid: @uid).first
  end
end