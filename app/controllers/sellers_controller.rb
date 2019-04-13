class SellersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_seller, only: [:show, :edit, :update, :destroy]

  # GET /sellers
  # GET /sellers.json
  def index
    @sellers = Seller.all
  end

  # GET /sellers/1
  # GET /sellers/1.json
  def show
    @seller = Seller.find(params[:id])
  end

  # GET /sellers/1/edit
  def edit
    @seller = Seller.find(params[:id])
  end

  # PATCH/PUT /sellers/1
  # PATCH/PUT /sellers/1.json

  # DELETE /sellers/1
  # DELETE /sellers/1.json
  def destroy
    @seller.destroy
    respond_to do |format|
      format.html { redirect_to sellers_url, notice: 'Seller was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seller
      @seller = Seller.find(params[:id])
    end
  
  
    def set_default_role
      self.role ||= :employee
    end
  
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
    has_many :stores, dependent: :destroy
    has_many :products
 
  

    # Never trust parameters from the scary internet, only allow the white list through.
    def seller_params
      params.fetch(:seller, {}).permit(:email, :name, :role)
    end
end
