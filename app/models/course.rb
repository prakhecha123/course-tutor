class Course < ApplicationRecord
    has_many :tutors, dependent: :destroy
  
    validates :name, presence: true
    validates :description, presence: true
end