json.array!(@serveys) do |servey|
  json.extract! servey, :id, :customer_id, :tab_id, :user_id, :alternate_number, :locality, :network_signal, :address_verified, :contact_person_name, :relation, :product_type, :category, :tariff_plan_confirm, :usage_detail, :receive_monthly_bill, :address_proof, :pan_card, :house_ownership, :staying_since, :type_of_residence, :handset_used, :vehicle_owned, :occupation, :credit_card, :ebill, :ecs
  json.url servey_url(servey, format: :json)
end
