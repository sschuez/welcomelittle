class ObituaryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
  	record.user == user || user.admin
  end

  def show?
  	true
    # record.user == user || user.admin
  end

  def update?
  	record.user == user || user.admin
  end
end
