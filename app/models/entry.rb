class Entry < ApplicationRecord
  belongs_to :place
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :occurred_on, presence: true
end
