class Bug < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :project


  validates :title, presence: true, uniqueness: true
  validates :picture, format: {with: %r{\.(gif|png)\Z}i , message: "only allows png"}
  validates :bug_type, presence: true
  validates :bug_status, presence: true
end
