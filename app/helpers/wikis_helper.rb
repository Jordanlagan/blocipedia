module WikisHelper
  def self.collabs_include_user?(user, wiki)
    result = false
    wiki.collaborators.each do |c|
      if c.user_id == user.id
        result = true
      end
    end
    result
  end
end
