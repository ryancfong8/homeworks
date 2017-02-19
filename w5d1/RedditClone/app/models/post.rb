class Post < ActiveRecord::Base
  validates :title, :subs, :author_id, presence: true

  belongs_to :author,
    class_name: 'User',
    foreign_key: :author_id

  has_many :postsubs, dependent: :destroy, inverse_of: :post, class_name: :PostSub, foreign_key: :post_id

  has_many :subs, through: :postsubs

  has_many :comments 

end
