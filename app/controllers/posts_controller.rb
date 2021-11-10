class PostsController < ApplicationController

    def index
        posts = Post.all
        render json: posts, status: :ok
    end

    def create
        post = Post.create(post_params)
        if post.valid?
            render json: post, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private

    def post_params
        params.permit(:name).merge(offering_id: params[:id])
    end

end
