# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord
  # validations
  validates :name,  presence: true,
                    uniqueness: true,
                    length: { minimum: 3, maximum: 25 }
end
