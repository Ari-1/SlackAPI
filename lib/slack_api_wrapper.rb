require 'httparty'
require 'pry'

class SlackApiWrapper

  def self.list_channels
    url = "https://slack.com/api/channels.list?token=#{ENV["SLACK_API_TOKEN"]}"
    response = HTTParty.get(url)

    unless response["ok"]
      raise StandardError.new(response["error!"])
    end

    details = response["channels"]
    return details
  end

end
