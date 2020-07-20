require 'test_helper'

class PrintLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @print_log = print_logs(:one)
  end

  test "should get index" do
    get print_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_print_log_url
    assert_response :success
  end

  test "should create print_log" do
    assert_difference('PrintLog.count') do
      post print_logs_url, params: { print_log: { boolean: @print_log.boolean, cost: @print_log.cost, filament_weight: @print_log.filament_weight, file_name: @print_log.file_name, print_time: @print_log.print_time, printer_id: @print_log.printer_id, status: @print_log.status } }
    end

    assert_redirected_to print_log_url(PrintLog.last)
  end

  test "should show print_log" do
    get print_log_url(@print_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_print_log_url(@print_log)
    assert_response :success
  end

  test "should update print_log" do
    patch print_log_url(@print_log), params: { print_log: { boolean: @print_log.boolean, cost: @print_log.cost, filament_weight: @print_log.filament_weight, file_name: @print_log.file_name, print_time: @print_log.print_time, printer_id: @print_log.printer_id, status: @print_log.status } }
    assert_redirected_to print_log_url(@print_log)
  end

  test "should destroy print_log" do
    assert_difference('PrintLog.count', -1) do
      delete print_log_url(@print_log)
    end

    assert_redirected_to print_logs_url
  end
end
