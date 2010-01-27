require 'test_helper'

class StrokesTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Strokes.new.valid?
  end
end
