class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :clickbait?
    CLICKBAIT_PATTERNS = [
        /Won't Believe/i,
        /Secret/i,
        /Top \d/i,
        /Guess/i
      ]
    
      def clickbait?
        if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
          errors.add(:title, "must be clickbait")
        end
    
    
    
    
    
    # validate :check_title

    # def check_title
    #     validates :title, :inclusion => { :in => %w(Won't Believe Secret Top Guess),
    #         :message => "The value: %{Top} is not included in Field Type." }
    end
end
