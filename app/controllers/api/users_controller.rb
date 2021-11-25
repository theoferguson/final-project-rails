module Api
    class UsersController < ApplicationController
    
    def index
        users = User.all
        render json: users, status: :ok
    end
    
    def show
        user = User.find_by(id: session[:user_id])
        if user
            render json: user, status: :ok
        else
            render json: { error: "not authorized" }, status: :unauthorized
        end
    end

    def create
        user = User.create(user_params)
        if user.valid?
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def update
        user = User.find_by(id: params[:id])
        if user
            user.update(user_params)
            render json: user, status: :ok
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def inbox
        messages = User.find_by(id: session[:user_id]).messages
        if messages
            render json: messages.to_json(:include => [:user, :sender, :post => {:include => :offering}]), status: :ok
        else
            render json: { error: "No messages" }, status: :unprocessable_entity
        end
    end

    def outbox
        messages = User.find_by(id: session[:user_id]).sender_messages
        if messages
            render json: messages.to_json(:include => [:user, :sender, :post => {:include => :offering}]), status: :ok
        else
            render json: { error: "No messages" }, status: :unprocessable_entity
        end
    end

    private

    def user_params
        params.permit(:username, :password, :password_confirmation, :name, :email, :picture, :company, :capacity_provider, :location, :industry)
    end
end
end
