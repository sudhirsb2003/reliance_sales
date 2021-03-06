class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :caf_number, :limit => 8
      t.integer :len
      t.integer :old_caf_number, :limit => 8
      t.integer :parent_Account_number, :limit => 8
      t.integer :account_number, :limit => 8
      t.integer :mdn, :limit => 8
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :fh_name
      t.string :nationality
      t.string :gender
      t.date :dob
      t.string :customer_type
      t.string :cust_category
      t.string :entity_name
      t.string :address_1
      t.string :address_2
      t.string :landmark
      t.string :city
      t.string :state
      t.string :pincode
      t.string :local_address_1
      t.string :local_address_2
      t.string :local_city
      t.string :local_state
      t.integer :local_pin
      t.string :email
      t.string :contact_number
      t.string :poi_type
      t.string :poa_type
      t.date :caf_entry_date
      t.integer :ageing
      t.integer :ageing_act
      t.string :rsn
      t.date :activation_date
      t.string :av_status
      t.string :cv_status
      t.string :caf_status
      t.string :scrutiny_status
      t.string :av_user_id
      t.string :cv_user_id
      t.string :otc_code
      t.string :circle
      t.string :caf_ciou
      t.string :ciou
      t.string :dnc
      t.string :telemarketing
      t.string :mobile
      t.string :av_agency
      t.date :av_done_date
      t.string :caf_updated_date
      t.string :scrutiny_updated_by
      t.string :reorder
      t.string :operator_name
      t.integer :operator_credit_limit
      t.integer :tariff_plan
      t.string :old_account_number
      t.integer :credit_limit
      t.integer :credit_score
      t.string :pos_code
      t.string :product_type
      t.string :mnp_flag
      t.string :service_type
      t.integer :pevious_cv_limit
      t.integer :re_av_count
      t.date :re_av_date
      t.string :av_neg_remarks
      t.string :re_av_reasons
      t.string :caf_remark
      t.string :av_neg_sub_reasons
      t.date :cv_done_date
      t.string :security_amount
      t.string :tariff_plan_value
      t.string :product_type_value
      t.string :corp_company_name
      t.string :wh_status
      t.string :omnidocs_status
      t.string :tmid
      t.date :pg_tvp_date
      t.string :tvp_status

      t.timestamps
    end
  end
end
