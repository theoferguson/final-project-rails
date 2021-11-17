class MessagesController < ApplicationController

    def index
        messages = Message.all
        render json: messages, status: :ok
    end

    def create
        message = Message.create(message_params)
        if message
            render json: post, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def inbox
            offerings = Message.select {|message| message.user_id == session[:user_id] || message.sender_id == session[:user_id]}
            render json: offerings, status: :ok
    end

    private

    def message_params
        params.permit(:user_id, :message, :post_id).merge(sender_id: session[:user_id])
    end

end