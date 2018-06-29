class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 100 }
  validates :summary, length: { maximum: 50 }
  validates :category, inclusion: { in: %w(Fiction) }
  validate  :title_clickbait

  private

  def title_clickbait
    binding.pry
    if title.include?("Won't Believe")
      errors[:base] << "title cannot be #{title}"
end
    #elsif title.donwcase.include?("top #{(1..1000)}")
    #  errors[:base] << "title cannot be #{title}"

    #elsif title.donwcase.include?("guess")
    #  errors[:base] << "title cannot be #{title}"

  #else title == "Secret"
  #    errors[:base] << "title cannot be #{title}"
  #  end
  end

end
