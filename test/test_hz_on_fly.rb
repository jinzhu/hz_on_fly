require 'test_helper'

class TestHzOnFlyTest < ActiveSupport::TestCase
  test "User" do
    user = User.create(:name => "ｽｽﾞｷ ｱｲﾘ", :age => "１３")
    assert_equal user.name, "スズキ　アイリ"
    assert_equal user.age, "13"

    user = User.create(:name => "スズキ　アイリ", :age => "13")
    assert_equal user.name, "スズキ　アイリ"
    assert_equal user.age, "13"
  end
end
