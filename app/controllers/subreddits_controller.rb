class SubredditsController < ApplicationController

  before_action :authorize, except: [:index, :show]

  def index
    @subreddits = Subreddit.all
  end

  def show
    @subreddit = Subreddit.find(params[:id])
  end

  def new
    @subreddit = current_user.subreddits.build
  end

  def create
    @subreddit = current_user.subreddits.build(subreddit_params)
    @subreddit.save
    flash[:success] = "Subreddit created"
    redirect_to subreddits_path
  end

  def edit
    @subreddit = Subreddit.find(params[:id])
  end

  def update
    @subreddit = Subreddit.find(params[:id])
    if @subreddit.update_attributes(subreddit_params)
      redirect_to @subreddit
      flash[:success] = "Subreddit updated"
    else
      # no test exists for failed update
      render 'edit'
      flash[:error] = "Subreddit failed to update"
    end
  end

  def destroy
      @subreddit = Subreddit.find(params[:id])
      if @subreddit.destroy
        flash[:success] = "Subreddit deleted!"
        redirect_to subreddits_path
      end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def subreddit_params
    params.require(:subreddit).permit(:title)
  end
end
