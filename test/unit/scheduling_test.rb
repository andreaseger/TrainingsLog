require 'test_helper'

class SchedulingTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Scheduling.new.valid?
  end
end
