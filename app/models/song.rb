class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, :uniqueness => {:scope => :release_year}
  validates :released, inclusion: { in: [ true, false ] }
  validates :release_year, presence: true, inclusion: { in: 1900..Time.now.year }, :if => :released?
  validates :artist_name, presence: true

  def released?
    self.released == true
  end

end
