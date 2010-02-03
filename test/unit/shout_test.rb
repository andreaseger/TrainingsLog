require 'test_helper'

class ShoutTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Shout.new.valid?
  end
end
