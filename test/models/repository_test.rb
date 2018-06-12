require 'test_helper'

class RepositoryTest < ActiveSupport::TestCase
  test "save without required fields" do
    repository = Repository.new
    assert_not repository.save
  end

  # test ""
end
