# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true, length: { maximum: Settings.validates.length.maximum.name }

  validates :email, presence: true, length: { maximum: Settings.validates.length.maximum.email },
                    format: { with: Settings.valid_email_regex },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length:  { minimum: Settings.validates.length.minimum.password,
                                                  maximum: Settings.validates.length.maximum.password,
                                                }
end
