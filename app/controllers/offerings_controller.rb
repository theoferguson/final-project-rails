class OfferingsController < ApplicationController

    def index
        offerings = Offering.all
        render json: offerings, status: :ok
    end

    def create
        offering = Offering.create(offering_params)
        if offering.valid?
            render json: offering, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def foruser
        offerings = Offering.select {|offering| offering.user_id == session[:user_id]}
        render json: offerings, status: :ok
    end

    def destroy
        offering = Offering.find(params[:id])
        offering.destroy
    end

    private

    def offering_params
        params.permit(:name, :less_than_truckload, :full_truckload, :origin, :origin_date, :destination, :destination_date, :asking_price).merge(user_id: session[:user_id])
    end

end
