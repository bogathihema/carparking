require 'test_helper'

class BookingslotsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bookingslots_index_url
    assert_response :success
  end

  test "should get new" do
    get bookingslots_new_url
    assert_response :success
  end

  test "should get create" do
    get bookingslots_create_url
    assert_response :success
  end

end
