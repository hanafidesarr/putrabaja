class SubscribeUser < ApplicationRecord
  validates :name, :email, presence: true
end
