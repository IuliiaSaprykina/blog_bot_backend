class BlogsController < ApplicationController

    def index
        @blogs = Blog.all 

        render json: { blogs: @blogs }, include: :users
    end

    def create
        @blog = Blog.create({
            title: params[:title],
            text_content: params[:text_content]
        })

        render json: { blog: @blog }
    end

    def destroy
        @blog = Blog.find(params[:id])
        @blog.destroy 

        render json: { message: "blog destroyed" }
    end

    
end
