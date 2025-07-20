class BlogsController < ApplicationController
  before_action :authenticate_request, except: [ :show ]
  def index
    blogs = Blog.all
    render json: BlogBlueprint.render_as_hash(blogs), status: :ok
  end

  def show
    blog = Blog.find(params[:id])
    render json: BlogBlueprint.render_as_hash(blog, view: :normal), status: :ok
  end

  def create
    blog = Blog.create(blog_params)
    render json: BlogBlueprint.render_as_hash(blog, view: :normal), status: :ok
  end

  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params)
    render json: BlogBlueprint.render_as_hash(blog, view: :normal), status: :ok
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    render json: BlogBlueprint.render_as_hash(blog, view: :normal), status: :ok
  end

private

def blog_params
  params.permit(:title, :content, :user_id)
end
end
