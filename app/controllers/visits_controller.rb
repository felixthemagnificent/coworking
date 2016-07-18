class VisitsController < ApplicationController
  before_action :set_visit, only: [:show, :edit, :update, :addmeal]

  # GET /visits
  # GET /visits.json
  def index
    @visits = Visit.all
  end

  # POST /visits/1
  def addmeal
    meal = Meal.where(name: meal_params[:meal])
    quantity = meal_params[:quantity]
    unless meal.nil?
      @visit.order.meals << meal
      @visit.order.order_details.last.update(quantity: quantity)
      respond_to do |format|
        format.js   { render :new_row, order: @visit.order.order_details.last }
      end
    end
  end

  # GET /visits/1
  # GET /visits/1.json
  def show
    sum = 0
    grid_details = []
    @visit.order.order_details.each do |od|

        grid_details.push({
          meal: od.meal.name,
          price_quant: od.quantity.to_s + ' x ' + od.meal.price.to_s,
          final_price: od.quantity * od.meal.price
          })
      sum += od.quantity * od.meal.price
      end unless @visit.order.nil?
      respond_to do |format|
        format.html { render :show }
        format.json { render json: grid_details }
      end
      #render json: grid_details
  end

  # GET /visits/new
  def new
    @visit = Visit.new
  end

  # GET /visits/1/edit
  def edit
  end

  # POST /visits
  # POST /visits.json
  def create
    @visit = Visit.new
    @visit.customer = Customer.where(visit_customer_params) unless Customer.where(visit_customer_params).empty?
    @visit.check_in = Time.now
    @visit.order = Order.new
    respond_to do |format|
      if @visit.save
        format.html { redirect_to @visit, notice: 'Visit was successfully created.' }
        format.json { render :show, status: :created, location: @visit }
      else
        format.html { render :new }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visits/1
  # PATCH/PUT /visits/1.json
  def update
    respond_to do |format|
      if @visit.update(visit_params)
        format.html { redirect_to @visit, notice: 'Visit was successfully updated.' }
        format.json { render :show, status: :ok, location: @visit }
      else
        format.html { render :edit }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visits/1
  # DELETE /visits/1.json
  def destroy
    @id = params[:id]
    visit_order_details = OrderDetail.find(@id)
    visit_order_details.destroy
    #.destroy
    respond_to do |format|
      format.html { redirect_to visits_url, notice: 'Visit was successfully destroyed.' }
      format.json { head :no_content }
      format.js { render 'delete_row', id: @id}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visit
      @visit = Visit.find(params[:id])
    end

    def meal_params
      params.require(:orderdetail).permit(:meal, :quantity)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def visit_save_params
      params.require(:visit).permit(:membership)
    end

    def visit_customer_params
      params.require(:other).permit(:name)
    end

    def visit_params
      params.require(:visit).permit(:membership, :check_in, :check_out)
    end
end
