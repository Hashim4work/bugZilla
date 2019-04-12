class Bug < ApplicationRecord
  mount_uploader :picture, PictureUploader

  belongs_to :project
  belongs_to :user

  validates :bug_status, :bug_type, presence: true
  validates :picture, format: {with: %r{\.(gif|png)\Z}i , message: "only allows png"}
  validates :title, presence: true, uniqueness: true

  validate :deadline_cannot_be_in_past, on: :create

private
	def deadline_cannot_be_in_past
		errors.add(:deadline, "can't be in past") if deadline.present? && deadline < Date.today
	end
end
