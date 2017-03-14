class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    #byebug
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = "El post ha sido creado con éxito"
      redirect_to posts_path
    else
      flash[:alert] = "Oh, oh! El post no ha sido creado con éxito"
      render :new
    end

  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "El post ha sido actualizado con éxito"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Oh, oh! El post no ha sido actualizado con éxito"
      render :edit
    end
    
    redirect_to post_path(@post)
  end

  def destroy

    #@post = Post.delete(params[:id]) #No ejecuta callbacks  

    @post = Post.find(params[:id])
    @post.destroy
    flash[:alert] = "El post ha sido eliminado con éxito"
    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])

    #Comments
    @comment = Comment.new
    @comment.post_id = @post.id
  end

  def index
    @posts = Post.all
  end

  private

  def post_params #Seguridad para que el usuario no pueda enviar más información de la requerida
    params.require(:post).permit(:author, :title, :content)
  end
end