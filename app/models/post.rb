class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 100 }
  validates :summary, length: { maximum: 50 }
  validates :category, inclusion: { in: %w(Fiction) }
  validates :title, inclusion: { in: %w(/(won't Believe|Secret|Top|Guess)/)}

  def clickbait
    #validates :title, exclusion: { in: %w(/(won't Believe|Secret|Top|Guess)/)}
    #!title.include?(/(won't Believe|Secret|Top|Guess)/)
  end

end
