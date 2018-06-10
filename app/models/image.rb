class Image < ApplicationRecord
    belongs_to :project
    has_many :answers
    has_many :questions
    has_one_attached :file
end
