class Parent < ActiveRecord::Base
belongs_to :student
  validates_presence_of :FatherName
  validates_presence_of :MotherName
  validates_presence_of :FatherEmail
  validates_presence_of :MotherEmail
  validates_uniqueness_of :FatherEmail, :MotherEmail
end
