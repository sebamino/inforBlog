# == Schema Information
#
# Table name: posts
#
#  id          :bigint           not null, primary key
#  title       :string
#  category_id :bigint           not null
#  description :text
#  user_id     :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Post < ApplicationRecord
  # Associations
  belongs_to :category
  belongs_to :user

  # Validations
  validates :title,       presence: true,
                          uniqueness: true,
                          length: { minimum: 3, maximum: 25 }
  validates :description, presence: true,
                          length: { minimum: 10, maximum: 500 }
  validates :category_id, presence: true
  validates :user_id,     presence: true
end
