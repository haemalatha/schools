class Student < ActiveRecord::Base
belongs_to :section
has_one :parent
  validates :StudentName, :Gender, :AdmissionNumber, :RollNumber, :DateOfBirth, presence:true
end
