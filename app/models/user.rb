# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :omniauthable, :timeoutable
  devise :confirmable, :database_authenticatable, :lockable, :recoverable,
         :registerable, :rememberable, :trackable, :validatable

  has_person_name
end
