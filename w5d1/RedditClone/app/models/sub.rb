class Sub < ActiveRecord::Base
  validates :title, :moderator_id, presence: true

  belongs_to :moderator,
    class_name: 'User'

  has_many :postsubs, dependent: :destroy, inverse_of: :sub, class_name: :PostSub, foreign_key: :sub_id
  has_many :posts, through: :postsubs

end
