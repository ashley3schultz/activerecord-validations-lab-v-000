class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 100 }
  validates :summary, length: { maximum: 50 }
  validates :category, inclusion: { in: %w(Fiction) }
  validate_with MyValidator

  class Post::MyValidator < ActiveModel::Validator
    def validate(record)
      if record.title.donwcase == "won't believe"
        record.errors[:base] << "title cannot be '#{title}'"

      elsif record.title.donwcase == "secret"
        record.errors[:base] << "title cannot be '#{title}'"

      elsif record.title.donwcase == "guess"
        record.errors[:base] << "title cannot be '#{title}'"

      else record.title.donwcase == "top #{(1..1000)}"
        record.errors[:base] << "title cannot be '#{title}'"
      end
    end
  end
end
