class CarModelsController < ApplicationController

  def index
    @car_models = CarModel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @car_models }
    end
  end

  def show
    @car_model = CarModel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @car_model }
    end
  end

  def new
    @brands = Brand.order :name
    @car_model = CarModel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @car_model }
    end
  end

  def create
    @car_model = CarModel.new(params[:car_model].merge(brand_id: params[:brand_id]))
    
    respond_to do |format|
      if @car_model.save
        format.html { redirect_to @car_model, notice: 'Car model was successfully created.' }
        format.json { render json: @car_model, status: :created, location: @car_model }
      else
        format.html { render action: "new" }
        format.json { render json: @car_model.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @car_model = CarModel.find(params[:id])
  end

  def update
    @car_model = CarModel.find(params[:id])

    respond_to do |format|
      if @car_model.update_attributes(params[:car_model])
        format.html { redirect_to @car_model, notice: 'Car model was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @car_model.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @car_model = CarModel.find(params[:id])
    @car_model.destroy

    respond_to do |format|
      format.html { redirect_to car_models_url }
      format.json { head :no_content }
    end
  end

end
