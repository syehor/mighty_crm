class EventsController < ApplicationController

  before_filter :event_client, except: [:index]

  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = @client.events.build
    car = @event.build_car
    car.build_car_model
    @models = CarModel.all
    # @event.build_client

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end


  # POST /events
  # POST /events.json
  def create
    @event = @client.events.build(params[:event])
    #just for testing purpose
    if current_user 
      # @event.client = User
      @event.car.user = current_user
      @event.assignee = current_user 
      # @event.client = current_user 
      @event.created_by = current_user 
    end

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end
  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  private

    def event_client
      @client = User.find(params[:user_id])
    end
end
