class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validate :valid_text_or_image

  mount_uploader :image, ImageUploader

  private

  def valid_text_or_image
    if text == "" && image.file.nil?
      errors.add(:message, "メッセージを入力してください")
    end
  end

end
