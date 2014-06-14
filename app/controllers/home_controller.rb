class HomeController < ApplicationController

  def index

    @body_class = "the_view"

    # twitter accounts
    twitter_account_hadfield    = "Cmdr_Hadfield"
    twitter_account_nyberg      = "AstroKarenN"
    twitter_account_mastracchio = "AstroRM"
    twitter_account_hopkins     = "AstroIllini"
    twitter_account_wakata      = "Astro_Wakata" # Koichi Wakata
    twitter_account_reid        = "astro_reid"

    # generic start and end IDs
    twitter_start_id = "300000000000000000"
    twitter_end_id = "999999999999999999"

    # user account start and end IDs
    twitter_hadfield_since_id = twitter_start_id
    twitter_hadfield_max_id = "334011022815944705"

    twitter_nyberg_since_id = "339350311237976064"
    twitter_nyberg_max_id = "399310043507486720"

    twitter_mastracchio_since_id = "402882298703396864"
    twitter_mastracchio_max_id = "466206745225093120"

    twitter_hopkins_since_id = "403632722725179392"
    twitter_hopkins_max_id = "440967166444044288"

    twitter_wakata_since_id = "408004336472436736"
    twitter_wakata_max_id = "466264417953673216"

    twitter_reid_since_id = "477007500353736704"
    twitter_reid_max_id = twitter_end_id


    # a max_id has been passed through the url (from pagination link)
    if params[:max_id] != nil
      tweet_max_id = params[:max_id]

      twitter_mastracchio_max_id = tweet_max_id.to_s
      twitter_hopkins_max_id = tweet_max_id.to_s
      twitter_wakata_max_id = tweet_max_id.to_s
      twitter_reid_max_id = tweet_max_id.to_s

      # the point at which we need to paginate AstroKarenN's tweets
      if tweet_max_id < twitter_nyberg_max_id
        twitter_nyberg_max_id = tweet_max_id.to_s
      end

      # the point at which we need to paginate Cmdr_Hadfield's tweets
      if tweet_max_id < twitter_hadfield_max_id
        twitter_hadfield_max_id = tweet_max_id.to_s
      end

    # no max_id
    else

    end



    # get the tweets
    @tweets_hadfield = Twitter.user_timeline(twitter_account_hadfield, :exclude_replies => true, :include_rts => false, :count => 100, :max_id => twitter_hadfield_max_id, :since_id => twitter_hadfield_since_id)
    @tweets_nyberg = Twitter.user_timeline(twitter_account_nyberg, :exclude_replies => true, :include_rts => false, :count => 100, :max_id => twitter_nyberg_max_id, :since_id => twitter_nyberg_since_id)
    @tweets_mastracchio = Twitter.user_timeline(twitter_account_mastracchio, :exclude_replies => true, :include_rts => false, :count => 100, :max_id => twitter_mastracchio_max_id, :since_id => twitter_mastracchio_since_id)
    @tweets_hopkins = Twitter.user_timeline(twitter_account_hopkins, :exclude_replies => true, :include_rts => false, :count => 100, :max_id => twitter_hopkins_max_id, :since_id => twitter_hopkins_since_id)
    @tweets_wakata = Twitter.user_timeline(twitter_account_wakata, :exclude_replies => true, :include_rts => false, :count => 100, :max_id => twitter_wakata_max_id, :since_id => twitter_wakata_since_id)
    @tweets_reid = Twitter.user_timeline(twitter_account_reid, :exclude_replies => true, :include_rts => false, :count => 100, :max_id => twitter_reid_max_id, :since_id => twitter_reid_since_id)


    # collate users tweets together
   # @tweets = @tweets_nyberg.zip(@tweets_hadfield).flatten.compact
    @tweets = @tweets_hadfield.zip(@tweets_nyberg).zip(@tweets_mastracchio).zip(@tweets_hopkins).zip(@tweets_wakata).zip(@tweets_reid).flatten.compact

    # sort tweets by date created
    @tweets.sort! { |a,b| b.created_at <=> a.created_at }
  end

end
