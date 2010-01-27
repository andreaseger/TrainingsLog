require 'test_helper'

class ItemsTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Items.new.valid?
  end
end
