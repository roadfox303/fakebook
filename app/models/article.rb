class Article < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  with_options unless: :image? do
    validates :content, presence: true
  end

end
