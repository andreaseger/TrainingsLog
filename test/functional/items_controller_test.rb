require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Items.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Items.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Items.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to items_url(assigns(:items))
  end
  
  def test_edit
    get :edit, :id => Items.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Items.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Items.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Items.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Items.first
    assert_redirected_to items_url(assigns(:items))
  end
  
  def test_destroy
    items = Items.first
    delete :destroy, :id => items
    assert_redirected_to items_url
    assert !Items.exists?(items.id)
  end
end
