class Image < ApplicationRecord
    has_many :answers
    has_one_attached :file
end
