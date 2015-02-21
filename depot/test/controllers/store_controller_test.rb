require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    #note: selectors that start with # match id attributes while selectors that start with . match on class attributes
    assert_response :success
    #verifies that there are a minimum of 4 elements
    assert_select '#columns #side a', minimum: 4
    #the next three lines verify there are three items with the class name entry inside of main
    assert_select '#main .entry', 3
    #verifies that there is an h3 element with the title of the Ruby book that we had entered previously
    assert_select'h3','Programming Ruby 1.9'
    #verifies taht the price is formatted correctly.
    assert_select '.price', /\$[,\d]+\.\d\d/
  end

end
