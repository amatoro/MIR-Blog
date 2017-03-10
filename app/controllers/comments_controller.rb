class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]

    if @comment.save
      redirect_to post_path(@comment.post)
    else
      render :new
    end

  end

  private

  def comment_params #Seguridad para que el usuario no pueda enviar más información de la requerida
    params.require(:comment).permit(:author, :body)
  end

end
