require 'test_helper'

class ShoutsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Shout.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Shout.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Shout.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to shout_url(assigns(:shout))
  end
  
  def test_edit
    get :edit, :id => Shout.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Shout.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Shout.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Shout.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Shout.first
    assert_redirected_to shout_url(assigns(:shout))
  end
  
  def test_destroy
    shout = Shout.first
    delete :destroy, :id => shout
    assert_redirected_to shouts_url
    assert !Shout.exists?(shout.id)
  end
end
