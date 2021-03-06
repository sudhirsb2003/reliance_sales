class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :login_required , only: [:show,:edit,:update]
  # GET /users
  # GET /users.json
  def index
    #if params[:term].present?
    #  @users = User.order(:name).where("name ilike ? and admin is false ","%#{params[:term]}%")
    #  render json: @users.map(&:name)
    #else
      @users= User.all.includes(:tab)
    #  render html: @users
    #end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    ids_to_exclude = Tab.joins(:user)
    @array_without_excluded_ids = Tab.where.not(id: ids_to_exclude)
  end

  # GET /users/new
  def new
    ids_to_exclude = Tab.joins(:user)
    @array_without_excluded_ids = Tab.where.not(id: ids_to_exclude)
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'new', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Tab user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :username, :address, :employee_uid,:photo,:password,:password_confirmation, :role_name, :tab_id )
    end

    def auth_user_params
      params.require(:user).permit(:name, :username,:password,:password_confirmation)
    end
end
