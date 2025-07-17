class BlogsController < ApplicationController
  # before_action :authenticate_request, except: [ :show ]
  def index
    blogs = Blog.all

    render json: BlogBlueprint.render(blogs), status: 200
  end

  def show
    blog = Blog.find(params[:id])

    render json: BlogBlueprint.render(blog, view: :normal), status: 200
  end

  def create
    blog = Blog.create(blog_params)

    render json: blog
  end

  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params)
    render json: blog
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy

    render json: blog
  end

private

def blog_params
  params.permit(:title, :content, :user_id)
end
end
