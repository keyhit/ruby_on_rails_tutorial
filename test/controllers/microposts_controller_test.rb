require 'test_helper'

class MicropostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @micropost = microposts(:one)
  end

  test 'should get index' do
    # binding.pry
    get user_microposts_url(@micropost)
    assert_response :success
  end

  test 'should get new' do
    get new_user_micropost_url(@micropost)
    assert_response :success
  end

  test 'should create micropost' do
    assert_difference('Micropost.count') do
      post user_microposts_url(@micropost), params: { micropost: { content: @micropost.content, user_id: @micropost.user_id } }
    end

    assert_redirected_to user_microposts_url(Micropost.last.user_id)
  end

  test 'should show micropost' do
    # binding.pry

    @user = users(:one)

    get user_micropost_url(@user.id, @micropost.id)
    assert_response :success
  end

  # test 'should get edit' do
  #   get edit_user_micropost_url(@user.micropost)
  #   assert_response :success
  # end

  # test 'should update micropost' do
  #   patch user_micropost_url(@micropost), params: { micropost: { content: @micropost.content, user_id: @micropost.user_id } }
  #   assert_redirected_to micropost_url(@micropost)
  # end

  # test 'should destroy micropost' do
  #   assert_difference('Micropost.count', -1) do
  #     delete user_micropost_url(@user.micropost)
  #   end

  #   assert_redirected_to microposts_url
  # end
end
