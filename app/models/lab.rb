class Lab < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :title_lab, :description, :fields, :students, :director_name, :director_email
  
  has_attached_file :logo, :styles => { :small => "300x150#" }

  has_many :students
  has_many :fields
  
  accepts_nested_attributes_for :students, :reject_if => lambda { |a| a[:mail].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :fields, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  
end
