require File.dirname(__FILE__) + '/../test_helper'
require 'votes_controller'

# Re-raise errors caught by the controller.
class VotesController; def rescue_action(e) raise e end; end

class VotesControllerTest < Test::Unit::TestCase
  def setup
    @controller = VotesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
