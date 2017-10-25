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
    !record.private? || record.user == user || WikisHelper.collabs_include_user?(user, record) || user.role == 'admin'
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      wikis = []
      if user.role == 'admin'
        wikis = scope.all
      elsif user.role == 'premium'
        all_wikis = scope.all
        all_wikis.each do |wiki|
          if !wiki.private? || wiki.user == user || WikisHelper.collabs_include_user?(user, wiki)
            wikis << wiki
          end
        end
      else
        all_wikis = scope.all
        wikis = []
        all_wikis.each do |wiki|
          if !wiki.private? || WikisHelper.collabs_include_user?(user, wiki)
            wikis << wiki
          end
        end
      end
      wikis
    end
  end
end
