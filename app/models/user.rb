class User < ActiveRecord::Base
  attr_accessible :github_id, :github_login
  has_many :tweets
end
