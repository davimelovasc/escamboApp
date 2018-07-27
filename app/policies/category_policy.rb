class CategoryPolicy < ApplicationPolicy

  def new?
    user.super?
  end



  class Scope < Scope
    def resolve
      scope
    end
  end
end
