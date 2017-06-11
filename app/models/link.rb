class Link < ApplicationRecord

  validates :original_link, presence: true
  after_create :generate_short_link



  private

  def generate_short_link
    characters = ['0'..'9', 'A'..'Z', 'a'..'z'].map { |range| range.to_a }.flatten - ["O", "0", "I", "l"]
    self.short_link = 6.times.map { characters.sample }.join until Link.find_by_short_link(self.short_link).nil?
    self.save
  end

end
