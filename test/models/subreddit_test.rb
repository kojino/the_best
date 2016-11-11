require 'test_helper'

class SubredditTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.create(username: 'kojinOshibaAaAaAa101')
    @subreddit = Subreddit.create(title: 'new number who dis', user: @user)
    @post = Post.create(title: 'Dis kojinOshibaAaAaAa101', body: 'test body', user: @user, subreddit: @subreddit)
    @comment = Comment.create(content: 'comment content', user: @user, post: @post)
  end

  test 'subreddit has title' do
    assert_equal @subreddit.title, 'new number who dis'
  end

  test "user id should be present" do
    assert_equal @subreddit.user, @user
  end

  test 'subreddit can contain posts' do
    assert_equal @subreddit.posts.count, 1
  end

  test "title should be present" do
    @subreddit.title = nil
    assert_not @subreddit.valid?
  end

  test "title is too long" do
    @subreddit.title = "i"*40
    assert_not @subreddit.valid?
  end

end
