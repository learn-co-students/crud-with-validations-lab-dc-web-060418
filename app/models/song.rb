class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: [:artist_name, :release_year] }

  validates :released, exclusion: { in: [nil] }

  validates :release_year, presence: true, if: :released?
  validates :release_year, inclusion: { within: 0..Time.now.year }, if: :released?
  
  validates :artist_name, presence: true
end
