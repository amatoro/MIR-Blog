class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_blogger?


  def create
    #byebug
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    

    if @comment.save
      flash[:notice] = 'El comentario ha sido creado'
      
    else
      flash[:alert] = 'El comentario no ha sido almacenado'
    end

    redirect_to post_path(@comment.post)

  end

  private

  def comment_params #Seguridad para que el usuario no pueda enviar más información de la requerida
    params.require(:comment).permit(:author, :body)
  end

  def is_blogger?
    unless current_user.blogger? || current_user.admin?
      flash[:alert] = "No tienes permisos para ejecutar esta acción"
      redirect_to root_path
    end
  end

end
