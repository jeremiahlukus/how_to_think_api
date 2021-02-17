class User < ApplicationRecord
  has_secure_password

  def admin?
    role == "admin"
  end

  def regular?
    role == "regular"
  end

  def guest?
    role == "guest"
  end
  def to_token_payload
    {
      sub: id,
      role: role,
      email: email,
      fname: fname
    }
  end
end
