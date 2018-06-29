class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 100 }
  validates :summary, length: { maximum: 50 }
  validates :category, inclusion: { in: %w(Fiction) }
  validate  :myvalidator

  private

  def myvalidator
    
    if title.donwcase.include?("won't believe")
      errors[:base] << "title cannot be #{title}"

    #elsif title.donwcase.include?("top #{(1..1000)}")
    #  errors[:base] << "title cannot be #{title}"

    #elsif title.donwcase.include?("guess")
    #  errors[:base] << "title cannot be #{title}"

    else title.donwcase.include?("secret")
      errors[:base] << "title cannot be #{title}"
    end
  end

end
