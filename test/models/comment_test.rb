require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
      # @user = User.create(username: 'kojinOshibaAaAaAa101')
      # @post = Post.create(title: 'Dis kojinOshibaAaAaAa101', body: 'test body', user: @user)
      # @comment = Comment.create(content: 'comment content', user: @user, post: @post)
      @user = User.create(username: 'kojinOshibaAaAaAa101')
      @subreddit = Subreddit.create(title: 'new number who dis')
      @post = Post.create(title: 'Dis kojinOshibaAaAaAa101', body: 'test body', subreddit: @subreddit)
      @comment = Comment.create(content: 'comment content', post: @post)

  end

  test 'comment has content' do
    assert_equal @comment.content, 'comment content'
  end

  # test 'user id should be present' do
  #   assert_equal @comment.user, @user
  # end

  test 'post id should be present' do
    assert_equal @comment.post, @post
  end

end
