require 'test_helper'

class FlightsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @flight = flights(:one)
  end

  test "should get index" do
    get flights_url, as: :json
    assert_response :success
  end

  test "should create flight" do
    assert_difference('Flight.count') do
      post flights_url, params: { flight: { arrival_time: @flight.arrival_time, departure_time: @flight.departure_time, destination_id: @flight.destination_id, number: @flight.number, origin_id: @flight.origin_id, passenger_id: @flight.passenger_id } }, as: :json
    end

    assert_response 201
  end

  test "should show flight" do
    get flight_url(@flight), as: :json
    assert_response :success
  end

  test "should update flight" do
    patch flight_url(@flight), params: { flight: { arrival_time: @flight.arrival_time, departure_time: @flight.departure_time, destination_id: @flight.destination_id, number: @flight.number, origin_id: @flight.origin_id, passenger_id: @flight.passenger_id } }, as: :json
    assert_response 200
  end

  test "should destroy flight" do
    assert_difference('Flight.count', -1) do
      delete flight_url(@flight), as: :json
    end

    assert_response 204
  end
end