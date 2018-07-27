class AdminPolicy < ApplicationPolicy

  def new?
    user.super?
  end



  class Scope < Scope
    def resolve
      if user.super?
        scope.all
      elsif user.normal?
        scope.normal
      end
    end
  end
end
