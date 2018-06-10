class Question < ApplicationRecord
  belongs_to :project
  has_many :answer_opts
end
