require 'pry'
class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait

  

  def clickbait
    if self.title
      if !self.title.include?("Won't Believe") && !self.title.include?("Secret") && !self.title.include?("Top [number]") && !self.title.include?("Guess")
        errors.add(:title, "Not clickbait!!!!")
      end
    end
  end
end
