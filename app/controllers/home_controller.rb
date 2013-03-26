class HomeController < ApplicationController
  def index

  @tweets = Twitter.user_timeline("Cmdr_Hadfield", :exclude_replies => true, :include_rts => false, :count => 200)
  end
end
