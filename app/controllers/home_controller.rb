class HomeController < ApplicationController
  def index

  @tweets = Twitter.user_timeline("Cmdr_Hadfield")

  end
end
