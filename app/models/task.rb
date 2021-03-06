class Task < ApplicationRecord

  belongs_to :user

  validates :name, presence: true, length: { maximum: 30 }
  validate :validate_name_not_including_comma

  scope :recent, -> { order(created_at: :desc) }

  private

  def validate_name_not_including_comma
    errors.add(:name, 'カンマを含めることはできません') if name&.include?(',')
  end
end
