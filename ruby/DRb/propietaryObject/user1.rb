class User
  include DRbUndumped

  attr_accessor :id, :username

  def save
    "Saved. <id: #{self.id}: username: #{self.username}>"
  end
end
