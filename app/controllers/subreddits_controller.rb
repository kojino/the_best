class SubredditsController < ApplicationController
  def index
    @subreddits = Subreddit.all
  end

  def new
    @subreddit = Subreddit.new
  end

  def create
    @subreddit = Subreddit.new(subreddit_params)
    @subreddit.save
    redirect_to subreddits_index_path
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def subreddit_params
    params.require(:subreddit).permit(:title)
  end
end
