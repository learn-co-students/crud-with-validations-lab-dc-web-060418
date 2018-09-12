class Song < ActiveRecord::Base
  validates :title,
    presence: true,
    uniqueness: { scope: [:release_year, :artist_name] }
  validates :released,
    inclusion: { in: [ true, false ] }
  validates :release_year,
    presence: true,
    numericality: {
      only_integer: true,
      greater_than: 0,
      less_than_or_equal_to: Date.today.year
    },
    if: :released?
  validates :artist_name,
    presence: true

  def released?
    released
  end
end
