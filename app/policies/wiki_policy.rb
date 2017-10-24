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

  def show?
    if record.private?
      user.premium? || user.admin?
    else
      user.present?
    end
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
