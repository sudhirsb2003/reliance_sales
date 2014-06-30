class CreateServeys < ActiveRecord::Migration
  def change
    create_table :serveys do |t|
      t.integer :customer_id
      t.integer :tab_id
      t.integer :user_id
      t.string :alternate_number
      t.string :locality
      t.string :network_signal
      t.string :address_verified
      t.string :contact_person_name
      t.string :relation
      t.string :product_type
      t.string :category
      t.boolean :tariff_plan_confirm
      t.string :usage_detail
      t.string :receive_monthly_bill
      t.string :address_proof
      t.string :pan_card
      t.string :house_ownership
      t.float :staying_since
      t.string :type_of_residence
      t.string :handset_used
      t.string :vehicle_owned
      t.string :occupation
      t.boolean :credit_card
      t.boolean :ebill
      t.boolean :ecs

      t.timestamps
    end
  end
end
