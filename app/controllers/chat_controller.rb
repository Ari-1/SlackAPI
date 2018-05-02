class ChatController < ApplicationController
  # We haven't seen an around_action before!
  # See if you can figure out why we've included it.
  around_action :catch_api_error

  def index
    @channels = SlackApiWrapper.list_channels
  end

  def new
    @channel_name = params[:channel]
  end

  def create
    message = params[:message]
    channel_name = params[:channel]

    SlackApiWrapper.send_message(channel_name, message)

    flash[:status] = :success
    flash[:message] = "Successfully sent message"
    redirect_to root_path
  end

  private
  def catch_api_error
    begin
      # This will run the actual controller action
      # Actually the same yield keyword as in
      # application.html.erb
      yield
    rescue SlackApiWrapper::SlackError => error
      flash[:status] = :failure
      flash[:message] = "API called failed: #{error}"
      redirect_back fallback_location: root_path
    end
  end
end
