class HomeController < ApplicationController

  def index

  	@body_class = "the_view"
    twitter_account = "Cmdr_Hadfield"
  	
  	if params[:max_id] != nil
  		tweet_max_id = params[:max_id].to_s
			@tweets = Twitter.user_timeline(twitter_account, :exclude_replies => true, :include_rts => false, :count => 100, :max_id => tweet_max_id)
		else
			@tweets = Twitter.user_timeline(twitter_account, :exclude_replies => true, :include_rts => false, :count => 100)
		end

  end

end
