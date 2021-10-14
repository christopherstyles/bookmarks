# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :omniauthable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :validatable, :confirmable

  has_person_name
end
