require 'test_helper'

class StaticTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Static.new.valid?
  end
end
