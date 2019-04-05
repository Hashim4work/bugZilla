class Project < ApplicationRecord
	has_many :bugs, dependent: :destroy
	validates :title, presence: true, length: { minimum: 5}
end
