class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: {minimum:250}
  validates :summary, length: {maximum:250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :click_bait

  def click_bait
    unless title.present? && title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
      errors.add(:title, 'your title is not clickbait-y')
    end
  end

end