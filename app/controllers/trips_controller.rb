class TripsController < ApplicationController
    before_action :find_trip, only:[:show, :destroy, :update]

    def index
        # authenticate!
        # if current_user
            @trips = Trip.all
            render :json => @trips , :status => :ok
        # else
        #     render :json => { :msg => "Login failed.. Try again" }
        # end
    end

    def show
        render :json => @trip
    end

    def create
        @trip = Trip.create(trip_params)
        if @trip.valid?
            render json: @trip, status: :created
        else
            render json: { error: 'failed to create trip' }, status: :not_acceptable
        end
    end

    def update
        @trip.update(trip_params)
        @trip.save
        render json: @trip, status: :updated
    end

    def destroy
        @trip.destroy
        render json: { msg: 'trip destroyed' }, status: :accepted
    end

    private

    def trip_params
        params.require(:trip).permit(:id, :user_id, :title, :description, :start_date, :is_public)
    end

    def find_trip
        @trip = Trip.find_by(id: params[:id])
    end
end
