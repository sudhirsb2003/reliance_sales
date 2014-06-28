class Customer < ActiveRecord::Base

 validates_presence_of:applicant_name, :application_ref_number, :address
 validates_uniqueness_of :application_ref_number

  #validate :valid_date?

  def valid_date?
    if self.date_of_birth.nil?
      errors.add(:date_of_birth, "is missing or invalid")
    end
  end

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  #has_one :servey, :dependent => :destroy
  has_one :customer_office
  belongs_to :tab
  belongs_to :customer_type
  has_one :assignment, dependent: :destroy
  has_one :servey, dependent: :destroy

  geocoded_by :full_address
  after_validation :geocode, :if => :address_changed?

  def full_address
   [address, coountry, city, state].compact.join(', ')
  end

	def should_generate_new_friendly_id?
		applicant_name_changed?
	end

def slug_candidates
    [
      :first_name,
      [:last_name],
      [:middle_name],
    ]
  end

 def self.import(file)
	 application_ref_number = 1001
   allowed_attributes = ['application_ref_number','customer_type_id','ageny_name', 'applicant_name', 'address', 'activation_code','dist_code', 'channel_string', 'caf_number', 'landmark', 'date_of_birth', 'pincode', 'contact_number', 'status', 'coountry', 'state', 'city', 'msisdn_number']
   spreadsheet = open_spreadsheet(file)
   header = spreadsheet.row(1)
   (2..spreadsheet.last_row).collect do |i|
    row = Hash[[header,spreadsheet.row(i)].transpose]
    customer = Customer.find_by_id(row["id"]) || new
    customer.attributes = row.to_hash.select { |k,v| allowed_attributes.include? k }
    customer.msisdn_number = spreadsheet.row(i)[3].to_i
    customer.application_ref_number = spreadsheet.row(i)[1].to_i
    customer.address = spreadsheet.row(i)[5]
    customer.pincode = spreadsheet.row(i)[7].to_i
    customer.dist_code = spreadsheet.row(i)[12].to_i
    if Customer.all.any?
      customer.application_ref_number = Customer.last.application_ref_number.to_i+1
    else
      customer.application_ref_number = application_ref_number.to_i
    end
    customer.save!
     if spreadsheet.row(i)[8].present?
       self.generate_customer_office_detail(customer, spreadsheet, i, row)
     end
     self.assign_customer_to_tab(customer)
   end
 end


end
