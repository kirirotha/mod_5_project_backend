class VisitsController < ApplicationController
    before_action :find_visit, only:[:show, :destroy, :update]

    def index
        # authenticate!
        # if current_user
            @visits = Visit.all
            render :json => @visits , :status => :ok
        # else
        #     render :json => { :msg => "Login failed.. Try again" }
        # end
    end

    def show
        render :json => @visit
    end

    def create
        @visit = Visit.create(visit_params)
        if @visit.valid?
            render json: @visit, status: :created
        else
            render json: { error: 'failed to create visit' }, status: :not_acceptable
        end
    end

    def update
        @visit.update(visit_params)
        @visit.save
        render json: @visit, status: :accepted
    end

    def destroy
        @visit.destroy
        render json: { msg: 'visit destroyed' }, status: :accepted
    end

    private

    def visit_params
        params.require(:visit).permit(:id, :trip_id, :location_name, :latitude, :longitude, :date_visited, :description, :phone, :reservable, :email, :stop_number)
    end

    def find_visit
        @visit = Visit.find_by(id: params[:id])
    end
end
