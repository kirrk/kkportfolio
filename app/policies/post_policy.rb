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



    def create?
      @user.author? || @user.editor? || @user.twitter?
    end

    def publish?
      @user.editor? || @user.author?
    end

    def destroy?
      @user.editor?
    end

    def permitted_attributes
      if user.author? || user.editor?
        [:title, :body, :published]
      else
        [:title, :body]
      end
    end

end
