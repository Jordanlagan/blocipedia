class WikiPolicy < ApplicationPolicy
  def update?
    user.present?
  end

  def create?
    user.present?
  end

  def destroy?
    user.present?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
