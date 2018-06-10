class Project < ApplicationRecord
    belongs_to :user
    has_many :images, dependent: :destroy
    has_many :questions, dependent: :destroy
end
