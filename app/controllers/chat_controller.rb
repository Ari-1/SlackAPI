class ChatController < ApplicationController
  def index
    @channels = SlackApiWrapper.list_channels
  end

  def new
    @channel = params[:channel]
  end

  def create
  end
end
