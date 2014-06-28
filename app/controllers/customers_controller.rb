class CustomersController < ApplicationController
  before_action :login_required
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:caf_number, :len, :old_caf_number, :parent_Account_number, :account_number, :mdn, :first_name, :last_name, :middle_name, :fh_name, :nationality, :gender, :dob, :customer_type, :cust_category, :entity_name, :address_1, :address_2, :landmark, :city, :state, :pincode, :local_address_1, :local_address_2, :local_city, :local_state, :local_pin, :email, :contact_number, :poi_type, :poa_type, :caf_entry_date, :ageing, :ageing_act, :rsn, :activation_date, :av_status, :cv_status, :caf_status, :scrutiny_status, :av_user_id, :cv_user_id, :otc_code, :circle, :caf_ciou, :ciou, :dnc, :telemarketing, :mobile, :av_agency, :av_done_date, :caf_updated_date, :scrutiny_updated_by, :reorder, :operator_name, :operator_credit_limit, :tariff_plan, :old_account_number, :credit_limit, :credit_score, :pos_code, :product_type, :mnp_flag, :service_type, :pevious_cv_limit, :re_av_count, :re_av_date, :av_neg_remarks, :re_av_reasons, :caf_remark, :av_neg_sub_reasons, :cv_done_date, :security_amount, :tariff_plan_value, :product_type_value, :corp_company_name, :wh_status, :omnidocs_status, :tmid, :pg_tvp_date, :tvp_status)
    end
end
