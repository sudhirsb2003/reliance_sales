require 'test_helper'

class ServeysControllerTest < ActionController::TestCase
  setup do
    @servey = serveys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:serveys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create servey" do
    assert_difference('Servey.count') do
      post :create, servey: { address_proof: @servey.address_proof, address_verified: @servey.address_verified, alternate_number: @servey.alternate_number, category: @servey.category, contact_person_name: @servey.contact_person_name, credit_card: @servey.credit_card, customer_id: @servey.customer_id, ebill: @servey.ebill, ecs: @servey.ecs, handset_used: @servey.handset_used, house_ownership: @servey.house_ownership, locality: @servey.locality, network_signal: @servey.network_signal, occupation: @servey.occupation, pan_card: @servey.pan_card, product_type: @servey.product_type, receive_monthly_bill: @servey.receive_monthly_bill, relation: @servey.relation, staying_since: @servey.staying_since, tab_id: @servey.tab_id, tariff_plan_confirm: @servey.tariff_plan_confirm, type_of_residence: @servey.type_of_residence, usage_detail: @servey.usage_detail, user_id: @servey.user_id, vehicle_owned: @servey.vehicle_owned }
    end

    assert_redirected_to servey_path(assigns(:servey))
  end

  test "should show servey" do
    get :show, id: @servey
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @servey
    assert_response :success
  end

  test "should update servey" do
    patch :update, id: @servey, servey: { address_proof: @servey.address_proof, address_verified: @servey.address_verified, alternate_number: @servey.alternate_number, category: @servey.category, contact_person_name: @servey.contact_person_name, credit_card: @servey.credit_card, customer_id: @servey.customer_id, ebill: @servey.ebill, ecs: @servey.ecs, handset_used: @servey.handset_used, house_ownership: @servey.house_ownership, locality: @servey.locality, network_signal: @servey.network_signal, occupation: @servey.occupation, pan_card: @servey.pan_card, product_type: @servey.product_type, receive_monthly_bill: @servey.receive_monthly_bill, relation: @servey.relation, staying_since: @servey.staying_since, tab_id: @servey.tab_id, tariff_plan_confirm: @servey.tariff_plan_confirm, type_of_residence: @servey.type_of_residence, usage_detail: @servey.usage_detail, user_id: @servey.user_id, vehicle_owned: @servey.vehicle_owned }
    assert_redirected_to servey_path(assigns(:servey))
  end

  test "should destroy servey" do
    assert_difference('Servey.count', -1) do
      delete :destroy, id: @servey
    end

    assert_redirected_to serveys_path
  end
end
