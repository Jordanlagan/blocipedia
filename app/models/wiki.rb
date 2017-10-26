class Wiki < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end

  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators

  validates :title, length: { minimum: 1 }, presence: true
  validates :body, length: { minimum: 1 }, presence: true
end
