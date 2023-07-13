# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  name                   :string
#  phone                  :string
#  age                    :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # Validations
  validates :name,      allow_blank: true,
                        length: { minimum: 3, maximum: 25 }
  validates :phone,     allow_blank: true,
                        length: { minimum: 10, maximum: 15 }
  validates :age,       allow_blank: true,
                        numericality: { only_integer: true, greater_than: 0, less_than: 100 }

  # Associations
  has_many :posts, dependent: :destroy
end
