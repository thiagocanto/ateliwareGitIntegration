require 'test_helper'

class RepositoryTest < ActiveSupport::TestCase
  test "save without name" do
    repository = Repository.new
    assert_not repository.save
  end
  test "save without url" do
    repository = Repository.new
    assert_not repository.save
  end

  # test ""
end
