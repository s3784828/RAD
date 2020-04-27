require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_new_url
    assert_response :success
  end

  def setup
    @user = users(:michael)
    @user = users(:archer)
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirected_to login_url
  end
  
  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@other_user)
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_redirected_to root_url
  end

  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_user)
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url

    #this test checks that a user not logged in gets redirected to 
    #the login page and a flash appears to tell the exactly that.

  end

  test "should redirect update when logged in as wrong user" do
    log_in_as(@other_user)
    patch user_path(@user), params: {user: {name: @user.name, email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_url

  end

  test "should redirect index when not logged in" do
    get users_path assert_redirected_to login_url
  end

  test "should not allow the admin attribute to be edited via the web" do
    log_in_as(@other_user)
    assert_not @other_user.admin?
    patch user_path(@other_user),params: {user: {password:FILL_IN,password_confirmation:FILL_IN,admin:FILL_IN} }
    assert_not @other_user.FILL_IN.admin?
  end

  #these have been commented as they are only used when a particular comment in user_controller has uncommented.

  # test "should redirect edit when not logged in" do
  #   get edit_user_path(@user)
  #   assert_not flash.empty?
  #   assert_redirected_to login_url

  #   #this test checks that a user not logged in gets redirected to 
  #   #the login page and a flash appears to tell the exactly that.

  # end

  # test "should redirect update when not logged in" do
  #   patch user_path(@user), params: {user: {name: @user.name, email: @user.email } }
  #   assert_not flash.empty?
  #   assert_redirected_to login_url

  #   #this 

  # end

end
