require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
  #     @user = User.create(username: 'kojinOshibaAaAaAa101')
  #     @subreddit = Subreddit.create(title: 'new number who dis', user: @user)
  #     @post = Post.create(title: 'Dis kojinOshibaAaAaAa101', body: 'test body', user: @user, subreddit: @subreddit)
  #     @comment = Comment.create(content: 'comment content', user: @user, post: @post)
    @user = User.create(username: 'kojinOshibaAaAaAa101')
    @subreddit = Subreddit.create(title: 'new number who dis')
    @post = Post.create(title: 'Dis kojinOshibaAaAaAa101', body: 'test body', subreddit: @subreddit)
    @comment = Comment.create(content: 'comment content', post: @post)

  end

  test 'post has columns' do
    assert_equal @post.title, 'Dis kojinOshibaAaAaAa101'
    assert_equal @post.body, 'test body'
  end

  # test "user id should be present" do
  #   assert_equal @post.user, @user
  # end

  test 'post can own comment' do
    assert_equal @post.comments.count, 1
  end

  test "subreddit id should be present" do
    assert_equal @post.subreddit, @subreddit
  end

  test "title should be present" do
    @post.title = nil
    assert_not @post.valid?
  end

  test "title is too long" do
    @post.title = "i"*150
    assert_not @post.valid?
  end

end
