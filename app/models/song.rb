class Song < ActiveRecord::Base
  # I don't understand how to validate an updated field for validity
  validates :artist_name, presence: true
  validates :title, presence: true
  validates :title, uniqueness: { scope: :release_year}, on: :create
  validates :released, inclusion: { in: [true, false]}
  validates :release_year, presence: true, if: :released?
  validate :validate_release_year

  def validate_release_year
    if release_year.present? && release_year > Time.now.year
      errors.add(:release_year, "can't be in the future")
    end
  end



end
