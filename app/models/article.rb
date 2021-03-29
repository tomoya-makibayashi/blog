class Article < ApplicationRecord
    has_one_attached :image, dependent: :destroy
    
    validates :title, :text, :image, presence: true
    
    belongs_to :user
end
