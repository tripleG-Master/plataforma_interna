class Joboffer < ApplicationRecord
    belongs_to :user
    has_many :applications, dependent: :destroy
    
    validates :title, presence: true
    validates :description, presence: true
    validates :salary, numericality: { only_integer: true, greater_than_or_equal_to: 0 }


end
