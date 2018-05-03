require 'httparty'
require 'pry'

class SlackApiWrapper

  def self.list_channels
    token = ENV["SLACK_API_TOKEN"]
    url = "https://slack.com/api/channels.list?token=#{token}&exclude_archived=1"
    response = HTTParty.get(url)

    unless response["ok"]
      raise StandardError.new(response["error!"])
    end

    # OR
    # raise_on_error(response)

    return response["channels"].map do |raw_channel|
      Channel.from_api(raw_channel)
    end
  end

  def self.send_message(channel_name, message)
    token = ENV["SLACK_API_TOKEN"]

    url_root = "https://slack.com/api/chat.postMessage"
    # construct the full URL from the endpoint and the query params
    full_url = URI.encode("#{url_root}?channel=#{channel_name}&text=#{message}&token=#{token}")

    puts "about to send request to #{full_url}"
    response = HTTParty.get(full_url)

    unless response["ok"]
      raise StandardError.new(response["error"])
    end

  end


end
