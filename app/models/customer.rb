class Customer < ActiveRecord::Base

 #validates_presence_of:applicant_name, :application_ref_number, :address
 #validates_uniqueness_of :application_ref_number

  #validate :valid_date?

  def valid_date?
    if self.date_of_birth.nil?
      errors.add(:date_of_birth, "is missing or invalid")
    end
  end

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  #has_one :servey, :dependent => :destroy
  #has_one :customer_office
  belongs_to :tab
  #belongs_to :customer_type
  has_one :assignment, dependent: :destroy
  #has_one :servey, dependent: :destroy

  #geocoded_by :full_address
  #after_validation :geocode, :if => :address_changed?

  def full_address
   [address, coountry, city, state].compact.join(', ')
  end

	def should_generate_new_friendly_id?
		#applicant_name_changed?
	end

  def slug_candidates
    [
      :first_name,
      [:first_name, :last_name]
    ]
  end

  def full_name
   [first_name, middle_name, last_name].join(' ')
  end


include Workflow

workflow_column :status

  workflow do

    state :pending do
      event :submit, :transitions_to => :submitted
    end

    state :submitted do
      event :complete, :transitions_to => :completed
    end

    state :completed do
      event :accept, :transitions_to => :verified
    end

    state :verified do
      event :re_assign, :transitions_to => :pending
    end

end






 def self.import(file)
	 application_ref_number = 1001
   allowed_attributes =['caf_number', 'len', 'old_caf_number',
 'parent_Account_number',
 'account_number',
 'mdn',
 'first_name',
 'last_name',
 'middle_name',
 'fh_name',
 'nationality',
 'gender',
 'dob',
 'customer_type',
 'cust_category',
 'entity_name',
 'address_1',
 'address_2',
 'landmark',
 'city',
 'state',
 'pincode',
 'local_address_1',
 'local_address_2',
 'local_city',
 'local_state',
 'local_pin',
 'email',
 'contact_number',
 'poi_type',
 'poa_type',
 'caf_entry_date',
 'ageing',
 'ageing_act',
 'rsn',
 'activation_date',
 'av_status',
 'cv_status',
 'caf_status',
 'scrutiny_status',
 'av_user_id',
 'cv_user_id',
 'otc_code',
 'circle',
 'caf_ciou',
 'ciou',
 'dnc',
 'telemarketing',
 'mobile',
 'av_agency',
 'av_done_date',
 'caf_updated_date',
 'scrutiny_updated_by',
 'reorder',
 'operator_name',
 'operator_credit_limit',
 'tariff_plan',
 'old_account_number',
 'credit_limit',
 'credit_score',
 'pos_code',
 'product_type',
 'mnp_flag',
 'service_type',
 'pevious_cv_limit',
 're_av_count',
 're_av_date',
 'av_neg_remarks',
 're_av_reasons',
 'caf_remark',
 'av_neg_sub_reasons',
 'cv_done_date',
 'security_amount',
 'tariff_plan_value',
 'product_type_value',
 'corp_company_name',
 'wh_status',
 'omnidocs_status',
 'tmid',
 'pg_tvp_date',
 'tvp_status',
 'created_at',
 'updated_at',
 'slug']
   spreadsheet = open_spreadsheet(file)
   header = spreadsheet.row(1)
   (2..spreadsheet.last_row).collect do |i|
    row = Hash[[header,spreadsheet.row(i)].transpose]
    customer = Customer.find_by_id(row["id"]) || new
    customer.attributes = row.to_hash.select { |k,v| allowed_attributes.include? k }
    customer.caf_number = spreadsheet.row(i)[0]
    customer.len = spreadsheet.row(i)[1]
    customer.old_caf_number = spreadsheet.row(i)[2]
    customer.parent_Account_number = spreadsheet.row(i)[3]
    customer.account_number = spreadsheet.row(i)[4]
    customer.mdn = spreadsheet.row(i)[5]
    customer.first_name = spreadsheet.row(i)[6]
    customer.last_name = spreadsheet.row(i)[7]
    customer.middle_name = spreadsheet.row(i)[8]
    customer.fh_name = spreadsheet.row(i)[9]
    customer.nationality = spreadsheet.row(i)[10]
    customer.gender = spreadsheet.row(i)[11]
    customer.dob = spreadsheet.row(i)[12]
    customer.customer_type = spreadsheet.row(i)[13]
    customer.cust_category = spreadsheet.row(i)[14]
    customer.entity_name = spreadsheet.row(i)[15]
    customer.address_1 = spreadsheet.row(i)[16]
    customer.address_2 = spreadsheet.row(i)[17]
    customer.landmark = spreadsheet.row(i)[18]
    customer.city = spreadsheet.row(i)[19]
    customer.state = spreadsheet.row(i)[20]
    customer.pincode = spreadsheet.row(i)[21].to_i
    customer.local_address_1 = spreadsheet.row(i)[22]
    customer.local_address_2 = spreadsheet.row(i)[23]
    customer.local_city = spreadsheet.row(i)[24]
    customer.local_state = spreadsheet.row(i)[25]
    customer.local_pin = spreadsheet.row(i)[26]
    customer.email = spreadsheet.row(i)[27]
    customer.contact_number = spreadsheet.row(i)[28]
    customer.poi_type = spreadsheet.row(i)[29]
    customer.poa_type = spreadsheet.row(i)[30]
    customer.caf_entry_date = spreadsheet.row(i)[31]
    customer.ageing = spreadsheet.row(i)[32]
    customer.ageing_act = spreadsheet.row(i)[33]
    customer.rsn = spreadsheet.row(i)[34].to_i
    customer.activation_date = spreadsheet.row(i)[35]
    customer.av_status = spreadsheet.row(i)[36]
    customer.cv_status = spreadsheet.row(i)[37]
    customer.caf_status = spreadsheet.row(i)[38]
    customer.scrutiny_status = spreadsheet.row(i)[39]
    customer.av_user_id = spreadsheet.row(i)[40]
    customer.cv_user_id = spreadsheet.row(i)[41]
    customer.circle = spreadsheet.row(i)[42].to_i
    customer.caf_ciou = spreadsheet.row(i)[43]
    customer.ciou = spreadsheet.row(i)[44]
    customer.dnc = spreadsheet.row(i)[45].to_i
    customer.telemarketing = spreadsheet.row(i)[46]
    customer.mobile = spreadsheet.row(i)[47]
    customer.av_agency = spreadsheet.row(i)[48].to_i
    customer.av_done_date = spreadsheet.row(i)[49]
    customer.caf_updated_date = spreadsheet.row(i)[50]
    customer.scrutiny_updated_by = spreadsheet.row(i)[51]
    customer.reorder = spreadsheet.row(i)[52]
    customer.operator_name = spreadsheet.row(i)[53]
    customer.operator_credit_limit = spreadsheet.row(i)[54]
    customer.tariff_plan = spreadsheet.row(i)[55]
    customer.old_account_number = spreadsheet.row(i)[56].to_i
    customer.credit_limit = spreadsheet.row(i)[57]
    customer.credit_score = spreadsheet.row(i)[58]
    customer.pos_code = spreadsheet.row(i)[59]
    customer.product_type = spreadsheet.row(i)[60]
    customer.mnp_flag = spreadsheet.row(i)[61]
    customer.service_type = spreadsheet.row(i)[62]
    customer.pevious_cv_limit = spreadsheet.row(i)[63]
    customer.re_av_count = spreadsheet.row(i)[64]
    customer.av_neg_remarks = spreadsheet.row(i)[65]
    customer.re_av_reasons = spreadsheet.row(i)[66]
    customer.caf_remark = spreadsheet.row(i)[67]
    customer.av_neg_sub_reasons = spreadsheet.row(i)[68]
    customer.cv_done_date = spreadsheet.row(i)[69]
    customer.security_amount = spreadsheet.row(i)[70]
    customer.tariff_plan_value = spreadsheet.row(i)[71]
    customer.product_type_value = spreadsheet.row(i)[72]
    customer.corp_company_name = spreadsheet.row(i)[73]
    customer.wh_status = spreadsheet.row(i)[74]
    customer.omnidocs_status = spreadsheet.row(i)[75]
    customer.tmid = spreadsheet.row(i)[76]
    customer.pg_tvp_date = spreadsheet.row(i)[77]
    customer.tvp_status = spreadsheet.row(i)[78]
    #customer.slug = spreadsheet.row(i)[79]
    customer.save!
   end
 end


private

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when '.csv' then Roo::Csv.new(file.path, nil, :ignore)
    when '.xls' then Roo::Excel.new(file.path, nil, :ignore)
    when '.xlsx' then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Pfiiflichopf!!"
    end
  end


end
