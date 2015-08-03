# Can't get this test file to run successfully

require_relative "./test_helper"

class TestController < Rulers::Controller
  def index
    "Hello!"  # not rendering view
  end
end

class TestApp < Rulers::Application
  def get_controller_and_action(env)
    [Object.const_get('TestController'), 'index']
  end
end

class RulersAppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_request
    get "/test/index"
    assert(last_response.ok?)
    body = last_response.body
    # assert_equal('Hello', body)
    assert(body["Hello blah"])
  end
end