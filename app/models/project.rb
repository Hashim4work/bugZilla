class Project < ApplicationRecord

	#belongs_to :user
	
	has_many :usersprojects, dependent: :destroy
	has_many :users, :through => :usersprojects

	has_many :bugs, dependent: :destroy
	validates :title, presence: true, length: { minimum: 5}
end
