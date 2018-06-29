class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 100 }
  validates :summary, length: { maximum: 50 }
  validates :category, inclusion: { in: %w(Fiction) }
  validates_with :clickbait

  def clickbait
    if title.include?(/(won't Believe|Secret|Top|Guess)/)
      errors.add :title, “cannot be clickbaity”
    end
  end

end
