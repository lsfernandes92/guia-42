class Book < ApplicationRecord

  mount_uploader :image, ImageUploader

  validates :name, uniqueness: { scope: [:author, :publisher] }
  validates :name, :author, :publisher, presence: true
  validates :stars, numericality: { less_than: 6 }

  validates_processing_of :image
  validate :image_size_validation

  private

  def image_size_validation
    errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
  end
end
