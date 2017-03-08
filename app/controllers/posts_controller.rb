class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    #byebug
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path
    else
      render :new
    end

  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    #flash.notice = "Post '#{@post.title}' Updated!"
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.delete(params[:id])
    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  private

  def post_params #Seguridad para que el usuario no pueda enviar más información de la requerida
    params.require(:post).permit(:author, :title, :content)
  end
end