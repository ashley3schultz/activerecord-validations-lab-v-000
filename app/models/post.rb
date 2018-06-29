class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 100 }
  validates :summary, length: { maximum: 50 }
  validates :category, inclusion: { in: %w(Fiction) }
  validate_with clickbait

  def clickbait
    validates :title, inclusion: { in: %w( Secret Top Guess)}
    #validates :title, exclusion: { in: %w(/(won't Believe|Secret|Top|Guess)/)}
    #!title.include?(/(won't Believe|Secret|Top|Guess)/)
  end

end


class MyValidator < ActiveModel::Validator
  def validate(record)
    if record.title.donwcase == "won't believe"
      record.errors[:base] << "title cannot be 'won't believe'"
      
    elsif record.title.donwcase == "secret"
      record.errors[:base] << "title cannot be 'secret'"
      
    elsif record.title.donwcase == "guess"
      record.errors[:base] << "title cannot be 'guess'"
    end
  end
end
 
