class Message < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  scope :for_display, -> { order(:created_at).last(50) }
  
  def mentions
    content.scan(/@(#{User::NAME_REGEX})/).flatten.map do |u|
      User.find_by(username: u)
    end.compact #removes nils
  end
end
