class Tweet < ActiveRecord::Base
  attr_accessible :text
  belongs_to :user
end
