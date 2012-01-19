class User

  attr_accessor :id, :username

  def save
    "Saved. <id: #{self.id}: username: #{self.username}>"
  end
end
