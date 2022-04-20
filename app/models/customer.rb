class Customer < ApplicationRecord
  validates :email, format: { with: /\A[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}\z/i,
    message: "must insert email format" }
end
