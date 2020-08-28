class UserBlogsController < ApplicationController
    

    def index
        authorization_header = request.headers["Authorization"]

        if !authorization_header
            render json: { error: "No token" }
        else
            @user_blogs = UserBlog.all 
            token = authorization_header.split(" ")[1]
            secret = Rails.application.secrets.secret_key_base
            payload = JWT.decode(token, secret).first

            render json: { user_blogs: @user_blogs }
        end
    end

    def create
        authorization_header = request.headers["Authorization"]

        if !authorization_header
            render json: { error: "No token" }
        else
            @user_blog = UserBlog.create({
                user_id: params[:user_id],
                blog_id: params[:blog_id]
            })
            token = authorization_header.split(" ")[1]
            secret = Rails.application.secrets.secret_key_base
            payload = JWT.decode(token, secret).first

            render json: { user_blog: @user_blog }
        end
    end

end
