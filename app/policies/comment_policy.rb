class CommentPolicy

  attr_accessor :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def update?
      @post.author == @user || @user.editor?
  end

  def create?
      @user.author? || @user.editor?
  end

  def publish?
      @user.editor? || @user.author?
  end

  def destroy?
    @user.editor || @user.author
  end

  def approved?
    @user.editor? || @user.author?
  end
end
