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
        flash[:notice] = "Comment is awaiting moderation"
        redirect_to @commentable, notice: "Comment created successfully."
        CommentMailer.delay_for(5.minutes).comment_new(@comment, @commentable)
      else
        instance_variable_set("@#{@resource.singularize}".to_sym, @commentable)
        render template: "#{@resource}/show"
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
    @resource, id = request.path.split('/')[1, 2]
    @commentable = @resource.singularize.classify.constantize.find(id)
  end
#end class
end
