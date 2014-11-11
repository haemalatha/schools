class Section < ActiveRecord::Base
belongs_to :standard
  has_many :students
  validates :name, presence: true
end
