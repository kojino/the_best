require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'user has username' do
    user = User.create(username: 'kojinOshibaAaAaAa101')

    assert_equal user.username, 'kojinOshibaAaAaAa101'
  end

end
