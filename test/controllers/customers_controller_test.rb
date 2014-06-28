require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  setup do
    @customer = customers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      post :create, customer: { account_number: @customer.account_number, activation_date: @customer.activation_date, address_1: @customer.address_1, address_2: @customer.address_2, ageing: @customer.ageing, ageing_act: @customer.ageing_act, av_agency: @customer.av_agency, av_done_date: @customer.av_done_date, av_neg_remarks: @customer.av_neg_remarks, av_neg_sub_reasons: @customer.av_neg_sub_reasons, av_status: @customer.av_status, av_user_id: @customer.av_user_id, caf_ciou: @customer.caf_ciou, caf_entry_date: @customer.caf_entry_date, caf_number: @customer.caf_number, caf_remark: @customer.caf_remark, caf_status: @customer.caf_status, caf_updated_date: @customer.caf_updated_date, ciou: @customer.ciou, circle: @customer.circle, city: @customer.city, contact_number: @customer.contact_number, corp_company_name: @customer.corp_company_name, credit_limit: @customer.credit_limit, credit_score: @customer.credit_score, cust_category: @customer.cust_category, customer_type: @customer.customer_type, cv_done_date: @customer.cv_done_date, cv_status: @customer.cv_status, cv_user_id: @customer.cv_user_id, dnc: @customer.dnc, dob: @customer.dob, email: @customer.email, entity_name: @customer.entity_name, fh_name: @customer.fh_name, first_name: @customer.first_name, gender: @customer.gender, landmark: @customer.landmark, last_name: @customer.last_name, len: @customer.len, local_address_1: @customer.local_address_1, local_address_2: @customer.local_address_2, local_city: @customer.local_city, local_pin: @customer.local_pin, local_state: @customer.local_state, mdn: @customer.mdn, middle_name: @customer.middle_name, mnp_flag: @customer.mnp_flag, mobile: @customer.mobile, nationality: @customer.nationality, old_account_number: @customer.old_account_number, old_caf_number: @customer.old_caf_number, omnidocs_status: @customer.omnidocs_status, operator_credit_limit: @customer.operator_credit_limit, operator_name: @customer.operator_name, otc_code: @customer.otc_code, parent_Account_number: @customer.parent_Account_number, pevious_cv_limit: @customer.pevious_cv_limit, pg_tvp_date: @customer.pg_tvp_date, pincode: @customer.pincode, poa_type: @customer.poa_type, poi_type: @customer.poi_type, pos_code: @customer.pos_code, product_type: @customer.product_type, product_type_value: @customer.product_type_value, re_av_count: @customer.re_av_count, re_av_date: @customer.re_av_date, re_av_reasons: @customer.re_av_reasons, reorder: @customer.reorder, rsn: @customer.rsn, scrutiny_status: @customer.scrutiny_status, scrutiny_updated_by: @customer.scrutiny_updated_by, security_amount: @customer.security_amount, service_type: @customer.service_type, state: @customer.state, tariff_plan: @customer.tariff_plan, tariff_plan_value: @customer.tariff_plan_value, telemarketing: @customer.telemarketing, tmid: @customer.tmid, tvp_status: @customer.tvp_status, wh_status: @customer.wh_status }
    end

    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should show customer" do
    get :show, id: @customer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer
    assert_response :success
  end

  test "should update customer" do
    patch :update, id: @customer, customer: { account_number: @customer.account_number, activation_date: @customer.activation_date, address_1: @customer.address_1, address_2: @customer.address_2, ageing: @customer.ageing, ageing_act: @customer.ageing_act, av_agency: @customer.av_agency, av_done_date: @customer.av_done_date, av_neg_remarks: @customer.av_neg_remarks, av_neg_sub_reasons: @customer.av_neg_sub_reasons, av_status: @customer.av_status, av_user_id: @customer.av_user_id, caf_ciou: @customer.caf_ciou, caf_entry_date: @customer.caf_entry_date, caf_number: @customer.caf_number, caf_remark: @customer.caf_remark, caf_status: @customer.caf_status, caf_updated_date: @customer.caf_updated_date, ciou: @customer.ciou, circle: @customer.circle, city: @customer.city, contact_number: @customer.contact_number, corp_company_name: @customer.corp_company_name, credit_limit: @customer.credit_limit, credit_score: @customer.credit_score, cust_category: @customer.cust_category, customer_type: @customer.customer_type, cv_done_date: @customer.cv_done_date, cv_status: @customer.cv_status, cv_user_id: @customer.cv_user_id, dnc: @customer.dnc, dob: @customer.dob, email: @customer.email, entity_name: @customer.entity_name, fh_name: @customer.fh_name, first_name: @customer.first_name, gender: @customer.gender, landmark: @customer.landmark, last_name: @customer.last_name, len: @customer.len, local_address_1: @customer.local_address_1, local_address_2: @customer.local_address_2, local_city: @customer.local_city, local_pin: @customer.local_pin, local_state: @customer.local_state, mdn: @customer.mdn, middle_name: @customer.middle_name, mnp_flag: @customer.mnp_flag, mobile: @customer.mobile, nationality: @customer.nationality, old_account_number: @customer.old_account_number, old_caf_number: @customer.old_caf_number, omnidocs_status: @customer.omnidocs_status, operator_credit_limit: @customer.operator_credit_limit, operator_name: @customer.operator_name, otc_code: @customer.otc_code, parent_Account_number: @customer.parent_Account_number, pevious_cv_limit: @customer.pevious_cv_limit, pg_tvp_date: @customer.pg_tvp_date, pincode: @customer.pincode, poa_type: @customer.poa_type, poi_type: @customer.poi_type, pos_code: @customer.pos_code, product_type: @customer.product_type, product_type_value: @customer.product_type_value, re_av_count: @customer.re_av_count, re_av_date: @customer.re_av_date, re_av_reasons: @customer.re_av_reasons, reorder: @customer.reorder, rsn: @customer.rsn, scrutiny_status: @customer.scrutiny_status, scrutiny_updated_by: @customer.scrutiny_updated_by, security_amount: @customer.security_amount, service_type: @customer.service_type, state: @customer.state, tariff_plan: @customer.tariff_plan, tariff_plan_value: @customer.tariff_plan_value, telemarketing: @customer.telemarketing, tmid: @customer.tmid, tvp_status: @customer.tvp_status, wh_status: @customer.wh_status }
    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should destroy customer" do
    assert_difference('Customer.count', -1) do
      delete :destroy, id: @customer
    end

    assert_redirected_to customers_path
  end
end
