require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @subreddit = Subreddit.create(title: 'Subreddit title')
    @post = Post.create(title: 'Post title', body: 'Post body', subreddit: @subreddit)
    @comment = Comment.create(content: 'Comment content', post: @post)
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post post_comments_url @post, params: { comment: { content: 'created', post_id: @post } }
    end

    # take user to 'index' of subreddits after creating one
    assert_redirected_to post_path @post
  end

  test "should get new" do
    get new_post_comment_url @post
    assert_response :success
  end

  test 'should get edit' do
    get edit_post_comment_url(@post, @comment)
  end


  test 'should update comment' do
    patch post_comment_url(@post, @comment), params: { comment: { content: 'updated' } }

    # take user to 'show' subreddit after editing one
    assert_redirected_to post_path(@post)

    # Reload data to fetch updated data and assert that title is updated.
    @comment.reload

    assert_equal 'updated', @comment.content
  end
end
