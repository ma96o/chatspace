class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validate :valid_text_or_image

  mount_uploader :image, ImageUploader

  def valid_text_or_image
    unless text || image.model[:image]
      errors.add(:message, "メッセージを入力してください")
    end
  end

end
