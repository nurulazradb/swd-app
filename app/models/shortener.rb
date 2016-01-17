class Shortener < ActiveRecord::Base
  validates :url, presence: true
  validates_format_of :url, :with => URI::regexp(%w(http https))

  before_save :set_slug

  private

  def set_slug
    self.slug = Digest::SHA1.hexdigest(self.url)[0..8]
  end
end
