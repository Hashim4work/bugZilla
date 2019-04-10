class Bug < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :project
  belongs_to :user

  validates :title, presence: true, uniqueness: true
  validates :picture, format: {with: %r{\.(gif|png)\Z}i , message: "only allows png"}
  validates :bug_type, presence: true
  validates :bug_status, presence: true
  validate :deadline_cannot_be_in_past, on: :create

private
	def deadline_cannot_be_in_past
		if deadline.present? && deadline < Date.today
			errors.add(:deadline, "cann't be in past")
		end
	end
end
