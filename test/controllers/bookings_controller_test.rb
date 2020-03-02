require 'test_helper'

class BookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bookings_index_url
    assert_response :success
  end

  test "should get invoice" do
    get bookings_invoice_url
    assert_response :success
  end

end
