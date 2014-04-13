class CommentsController < ApplicationController
  before_filter :load_commentable, except: [:index]

  def index
    authorize Comment
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(comment_params)
      if @comment.save
        redirect_to @commentable, notice: "Comment created successfully."
      else
        render :new
  end
end


private


  def comment_params
    params.require(:comment).permit(:author,
                                    :author_url,
                                    :author_email,
                                    :content,
                                    :referrer,
                                    :approved,
                                    :commentable_id)
  end


  def load_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

#end class
end
