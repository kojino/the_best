require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
      # @user = User.create(username: 'kojin')
      # @subreddit = Subreddit.create(title: 'new number who dis', user: @user)
      # @post = Post.create(title: 'Dis kojin', body: 'Post body text', user: @user, subreddit: @subreddit)
      # @comment = Comment.create(content: 'comment content', user: @user, post: @post)
      @user = User.create(username: 'kojinOshibaAaAaAa101')
      @subreddit = Subreddit.create(title: 'new number who dis')
      @post = Post.create(title: 'Dis kojinOshibaAaAaAa101', body: 'test body', subreddit: @subreddit)
      @comment = Comment.create(content: 'comment content', post: @post)
  end

  # test 'user can create subreddit' do
  #   assert_equal @user.subreddits.count, 1
  # end
  #
  # test 'user can create post' do
  #   assert_equal @user.posts.count, 1
  # end
  #
  # test 'user can create comment' do
  #   assert_equal @user.comments.count, 1
  # end

  test "should be valid" do
    assert @user.valid?
  end

  test "username should be present" do
    @user.username = nil
    assert_not @user.valid?
  end

  test "username is too long" do
    @user.username = "i"*80
    assert_not @user.valid?
  end

  test "username is too short" do
    @user.username = "i"
    assert_not @user.valid?
  end




end
