class SharedNote < ApplicationRecord
  belongs_to :note
  belongs_to :user

  validates :shared_with_email, presence: true
end
