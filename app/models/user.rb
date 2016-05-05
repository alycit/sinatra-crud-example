class User < ActiveRecord::Base
  include BCrypt

  has_many :games

  validates :username, :name, presence: true

  def password
    @password ||= Password.new(password_type_thing)
  end

  def password=(plain_text_password)
    @password = Password.create(plain_text_password)
    self.password_type_thing = @password
  end

  def authenticate(plain_text_password)
    self.password == plain_text_password
  end
end
