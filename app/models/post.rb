class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 100 }
  validates :summary, length: { maximum: 50 }
  validates :category, inclusion: { in: %w(Fiction) }
  validate  :title_clickbait

  private

  def title_clickbait
    if title && !title.include?("Won't Believe")
      #errors[:base] << "title cannot be #{title}"

    elsif title && !title.include?("Guess")
      errors[:base] << "title cannot be #{title}"

    elsif title && !title.include?("Top")
      errors[:base] << "title cannot be #{title}"

    else title && !title.include?("Secret")
      errors[:base] << "title cannot be #{title}"
    end
  end

end
