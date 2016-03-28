class User < ActiveRecord::Base
  has_many :games

  validates :username, :name, presence: true
end
