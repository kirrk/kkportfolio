class PostPolicy < ApplicationPolicy

  class Scope < Struct.new(:user, :scope)
 def resolve
       if user
        return scope.where(author_id: user.id) if user.author?
        return scope.all if user.author?
      end
        scope.where(:published => true)
      end
    end

    attr_accessor :user, :post

def initialize(user, post)
    @user = user
    @post = post
  end


def update?
    @post.author == @user || @user.editor?
end

def create?
    @user.author? || @user.editor?
end

def publish?
    @user.editor? || author?
end

def destroy?
    @user.editor?
end

def permitted_attributes
    attributes = []
    attributes << [:title, :body] if @user.author? || @user.editor?
    attributes << [:published] if @user.author? || @user.editor?
    attributes
  end
end
