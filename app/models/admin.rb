class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: { super: 0, normal: 1 }

  scope :supers, -> { where(role: "super") }
  scope :normals, -> { where(role: "normal") }

end
