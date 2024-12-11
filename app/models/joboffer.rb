class Joboffer < ApplicationRecord
    belongs_to :user
    
    has_many :applications, dependent: :destroy
    
    validates :title, presence: true
    validates :description, presence: true
    

end
