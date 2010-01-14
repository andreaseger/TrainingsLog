require 'test_helper'

class ToolsTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Tools.new.valid?
  end
end
