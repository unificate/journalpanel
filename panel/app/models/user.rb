class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def email_required?
    return false
  end

  def will_save_change_to_email?
    false
  end

  # This should obviously compare the argument with the users role and return true or false
  # Currently users don't actually have roles though...
  def is_role(r)
    true
  end
end
