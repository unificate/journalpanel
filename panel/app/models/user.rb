class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attribute :role, :string, default: 'developer'

  def email_required?
    return false
  end

  def will_save_change_to_email?
    return false
  end

  # Checks if user has role
  def is_role(r)
    return r == role
  end
end
