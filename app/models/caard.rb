class Caard < ApplicationRecord
  belongs_to :user
  attr_accessor :token
  validates :token, presence: true
end
