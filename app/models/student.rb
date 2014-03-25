class Student < ActiveRecord::Base
	belongs_to :school
	belongs_to :parent
	belongs_to :payment
	validates_associated :school
	validates :firstname, presence: true
	validates :lastname, presence: true
	validates :gender, presence: true
	#validates_presence_of :firstname, :lastname, :school
	validates_inclusion_of :gender, :in => %w( m f M F)

	def fullname
		"#{firstname} #{lastname}"
	end

end
