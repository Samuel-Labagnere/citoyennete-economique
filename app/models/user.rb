class User < ApplicationRecord
  belongs_to :organisation, optional: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def to_s
    "#{ last_name.upcase } #{ first_name.capitalize }"
  end
end
