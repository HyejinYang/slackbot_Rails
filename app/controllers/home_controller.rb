# require 'faraday'
require 'json'

BASE_URL = "https://slack.com/api/"
TOKEN = 'xoxb-1226046072595-1234700942100-NpL8v6FBKYYXo0CSoh721R5P'

GREETINGS=[
    {
        "type": "section",
        "text": {
            "type": "mrkdwn",
            "text": "안녕하세요? 탁구봇 김탁구입니다. 탁구 내기와 관련된 건 kimtakoo를 불러주세요!"
        }
    },
    {
        "type": "divider"
    },
    {
        "type": "actions",
        "elements": [
            {
                "type": "button",
                "text": {
                    "type": "plain_text",
                    "text": "탁구 내기 결과 입력",
                    "emoji": true
                },
                "value": "click_me_123",
                "action_id": "action_takoo_match"
            },
            {
                "type": "button",
                "text": {
                    "type": "plain_text",
                    "text": "탁구 내기 빚 보기",
                    "emoji": true
                },
                "value": "click_me_12"
            },
        ]
    }
]

class HomeController < ApplicationController
  def index
    if params.has_key?(:challenge)
      render json: params[:challenge]
    end

    if params[:event][:type] == "app_mention"

      puts "="*20
      puts JSON.pretty_generate(params)
      puts "="*20
      msg = {:token => TOKEN,
             :channel => params[:event][:channel],
             :text => params[:event][:text],
             :blocks => GREETINGS.to_json
      }

      req = Faraday.new
      res = req.post BASE_URL << 'chat.postMessage', msg

      # begin
      #   puts JSON.pretty_generate(JSON.parse(res.body))
      # rescue
      #   puts "Error occurred"
      # end
    end


  end

  def bot
    puts "="*20 + "버튼 눌렀을 때" + "="*20
    payload_hash = JSON.parse(params[:payload])
    puts JSON.pretty_generate(payload_hash)
    # puts payload_hash
    puts "="*40

    msg = {"token" => 'xoxb-1226046072595-1234700942100-NpL8v6FBKYYXo0CSoh721R5P',
           "channel" => "announcements",
           "text" => 'ㄴㅁㅎㅇ',
    }
    req = Faraday.new
    res = req.post BASE_URL << payload_hash["response_url"], msg
  end
end
