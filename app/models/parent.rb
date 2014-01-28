class Parent < ActiveRecord::Base
  has_many :students

  def fullname
  	"#{firstname} #{lastname}"
  end
end
