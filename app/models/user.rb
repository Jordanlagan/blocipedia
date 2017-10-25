class User < ApplicationRecord

  after_initialize { self.role ||= :standard }

  has_many :wikis, dependent: :destroy
  has_many :collaborators
  has_many :wiki_collaborators, through: :collaborators, source: :wiki

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:standard, :premium, :admin]
end
