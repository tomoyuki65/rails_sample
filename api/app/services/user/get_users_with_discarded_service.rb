class User::GetUsersWithDiscardedService

  def self.call(...)
    new(...).call
  end
  
  def initialize()
  end
    
  def call
    @users = User.with_discarded
  end
end