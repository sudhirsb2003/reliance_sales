class ServeysController < ApplicationController
  before_action :set_servey, only: [:show, :edit, :update, :destroy]

  # GET /serveys
  # GET /serveys.json
  def index
    @serveys = Servey.all
  end

  # GET /serveys/1
  # GET /serveys/1.json
  def show
  end

  # GET /serveys/new
  def new
    @servey = Servey.new
    @customer = Customer.find(params[:customer_id])
  end

  # GET /serveys/1/edit
  def edit
  end

  # POST /serveys
  # POST /serveys.json
  def create
    @servey = Servey.new(servey_params)

    respond_to do |format|
      if @servey.save
        format.html { redirect_to @servey, notice: 'Servey was successfully created.' }
        format.json { render :show, status: :created, location: @servey }
      else
        format.html { render :new }
        format.json { render json: @servey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /serveys/1
  # PATCH/PUT /serveys/1.json
  def update
    respond_to do |format|
      if @servey.update(servey_params)
        format.html { redirect_to @servey, notice: 'Servey was successfully updated.' }
        format.json { render :show, status: :ok, location: @servey }
      else
        format.html { render :edit }
        format.json { render json: @servey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /serveys/1
  # DELETE /serveys/1.json
  def destroy
    @servey.destroy
    respond_to do |format|
      format.html { redirect_to serveys_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_servey
      @servey = Servey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def servey_params
      params.require(:servey).permit(:customer_id, :tab_id, :user_id, :alternate_number, :locality, :network_signal, :address_verified, :contact_person_name, :relation, :product_type, :category, :tariff_plan_confirm, :usage_detail, :receive_monthly_bill, :address_proof, :pan_card, :house_ownership, :staying_since, :type_of_residence, :handset_used, :vehicle_owned, :occupation, :credit_card, :ebill, :ecs)
    end
end
