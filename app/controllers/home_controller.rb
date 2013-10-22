class HomeController < ApplicationController

  def index

  	@body_class = "the_view"
    twitter_account_hadfield  = "Cmdr_Hadfield"
    twitter_account_nyberg    = "AstroKarenN"
  	
  	if params[:max_id] != nil
  		tweet_max_id = params[:max_id].to_s
			#@tweets = Twitter.user_timeline(twitter_account, :exclude_replies => true, :include_rts => false, :count => 100, :max_id => tweet_max_id)
      @tweets_hadfield = Twitter.user_timeline(twitter_account_hadfield, :exclude_replies => true, :include_rts => false, :count => 100, :max_id => "334011022815944705")
      @tweets_nyberg = Twitter.user_timeline(twitter_account_nyberg, :exclude_replies => true, :include_rts => false, :count => 100, :max_id => tweet_max_id)
		else
			#@tweets = Twitter.user_timeline(twitter_account, :exclude_replies => true, :include_rts => false, :count => 100, :max_id => "334011022815944705")
		  @tweets_hadfield = Twitter.user_timeline(twitter_account_hadfield, :exclude_replies => true, :include_rts => false, :count => 100, :max_id => "334011022815944705")
      @tweets_nyberg = Twitter.user_timeline(twitter_account_nyberg, :exclude_replies => true, :include_rts => false, :count => 100, :max_id => "999999999999999999")
    end

    @tweets = @tweets_nyberg.zip(@tweets_hadfield).flatten.compact
    @tweets.sort! { |a,b| b.created_at <=> a.created_at }
    #.attrs[:created_at]
  end

end
