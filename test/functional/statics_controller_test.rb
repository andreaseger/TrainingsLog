require 'test_helper'

class StaticsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Static.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Static.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Static.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to static_url(assigns(:static))
  end
  
  def test_edit
    get :edit, :id => Static.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Static.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Static.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Static.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Static.first
    assert_redirected_to static_url(assigns(:static))
  end
  
  def test_destroy
    static = Static.first
    delete :destroy, :id => static
    assert_redirected_to statics_url
    assert !Static.exists?(static.id)
  end
end
