class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators

  validates :title, length: { minimum: 1 }, presence: true
  validates :body, length: { minimum: 1 }, presence: true
end
