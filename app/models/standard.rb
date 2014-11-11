class Standard < ActiveRecord::Base
belongs_to :school
  has_many :sections
  has_many :students, through: :sections
  validates :name, presence: true
end
