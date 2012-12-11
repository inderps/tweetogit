class MessageController < ApplicationController
  def tweet
  end
  def create
    render action: :tweet
  end
end
