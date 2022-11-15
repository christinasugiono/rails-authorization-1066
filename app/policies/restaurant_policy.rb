class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      user.admin? ? scope.all : scope.where(user: user)
    end
  end

  def show?
    true
  end

  def create?
    user.admin?
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
