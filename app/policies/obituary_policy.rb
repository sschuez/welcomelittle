class ObituaryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
  	true
  end

  def show?
  	true
  end

  def update?
  	user_or_admin
  end

  def destroy?
    user_or_admin
  end

  def text?
    user_or_admin
  end

  def destroy_text?
    user_or_admin
  end

  private

  def user_or_admin
    record.user == user || user.admin
  end
end
