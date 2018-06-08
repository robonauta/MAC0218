class Answer < ApplicationRecord
    has_many :answers_opts
    belongs_to :user
    has_one :image
end
