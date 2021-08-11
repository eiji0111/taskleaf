class Task < ApplicationRecord

  belongs_to :user

  before_validation :set_nameless_name
  validates :name, presence: true, length: { maximum: 30 }
  validate :validate_name_not_including_comma

  scope :recent, -> { order(created_at: DESC) }

  private

  def validate_name_not_including_comma
    errors.add(:name, 'カンマを含めることはできません') if name&.include?(',')
  end
end
