class Book < ApplicationRecord

  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @book = Book.where("title","#{word}%")
    elsif search == "forward_match"
      @book = Book.where("body","#{word}%")
    else
      @book = Book.all
    end
  end


end
