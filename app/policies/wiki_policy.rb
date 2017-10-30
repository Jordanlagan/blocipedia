class WikiPolicy < ApplicationPolicy
  include WikisHelper

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
    if user.present?
      !record.private? || record.user == user || WikisHelper.collabs_include_user?(user, record) || user.role == 'admin'
    end
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      wikis = []
      if user
        if user.admin?
          wikis = scope.all
        elsif user.premium?
          scope.all.each do |wiki|
            if !wiki.private? || wiki.user == user || WikisHelper.collabs_include_user?(user, wiki)
              wikis << wiki
            end
          end
        elsif user.standard?
          scope.all.each do |wiki|
            if !wiki.private? || wiki.user == user || WikisHelper.collabs_include_user?(user, wiki)
              wikis << wiki
            end
          end
        end
      else
        wikis = Wiki.all.where(private: false).to_a
      end
      wikis
    end
  end
end
