class Livro < ApplicationRecord

  mount_uploader :image, ImageUploader

  validates :nome, uniqueness: { scope: [:autor, :editora] }
  validates :nome, :autor, :editora, presence: true
  validates :nota, numericality: { less_than: 6 }

  validates_processing_of :image
  validate :image_size_validation

  private

  def image_size_validation
    errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
  end

end
