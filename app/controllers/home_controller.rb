# require 'faraday'
require 'json'

BASE_URL = "https://slack.com/api/"
TOKEN = 'xoxb-1226046072595-1234700942100-10fZCYVmR0yigwdfPBYwZTHV'

class HomeController < ApplicationController
  def index
    puts params
    if params.has_key?(:challenge)
      render json: params[:challenge]
    end

    if params[:event][:type] == "app_mention"
      msg = {:token => TOKEN,
             :channel => 'announcements',
             :text => params[:event][:text].as_json}

      req = Faraday.new
      res = req.post BASE_URL << 'chat.postMessage', msg
    else
      puts "params"
      puts "=" * 20
      puts params
      puts "=" * 20
      # params[:event][:type] == 'asfd'
      blck = {
          "type":"home",
          "blocks":[
              {
                  "type":"section",
                  "text":{
                      "type":"mrkdwn",
                      "text":"A simple stack of blocks for the simple sample Block Kit Home tab."
                  }
              },
              {
                  "type":"actions",
                  "elements":[
                      {
                          "type":"button",
                          "text":{
                              "type":"plain_text",
                              "text":"Action A",
                              "emoji":true
                          }
                      },
                      {
                          "type":"button",
                          "text":{
                              "type":"plain_text",
                              "text":"Action B",
                              "emoji":true
                          }
                      }
                  ]
              }
          ]
      }

      # msg = {:token => TOKEN,
      #        :user_id => 'U0170DL7G81',
      #        :views => blck.as_json}
      #
      # req = Faraday.new
      # res = req.post BASE_URL << 'views.publish', msg
    end
    # begin
    #   puts res.body
    # rescue
    #   puts "Error occurred"
    # end
  end
end
