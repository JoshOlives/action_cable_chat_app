class Message < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  scope :for_display, -> { order(:created_at).last(50) }
  before_create :color_update
  
  def mentions
    content.scan(/@(#{User::NAME_REGEX})/).flatten.map do |u|
      User.find_by(username: u)
    end.compact #removes nils
  end
  
  def background
    color_regex = /<\s*(\d{1,3})\s*,\s*(\d{1,3})\s*,\s*(\d{1,3})\s*,\s*(\d?.\d{0,2})\s*>/
    content.scan(color_regex)[0]
  end
  
  def self.delete_all
    Message.all.each {|m| m.delete}
  end
  
  private
  
    def color_update
      if self.background
        self.color = "rgba(#{self.background.join(", ")})"
      else
        self.color = "rgba(0,0,0,0)"
      end
    end
end
