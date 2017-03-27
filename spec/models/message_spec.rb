require 'rails_helper'

describe Message do
  describe '#create' do

    it 'is valid with a text ' do
      message = build(:message, image: "")
      message.valid?
      expect(message).to be_valid
    end

    it 'is valid with an image' do
      message = build(:message, text: "")
      message.valid?
      expect(message).to be_valid
    end

    it 'is invalid without a text & an image' do
      message = build(:message, text: "", image: "")
      message.valid?
      expect(message.errors[:message][0]).to include("メッセージを入力してください")
    end

    it 'is valid with all attributes' do
      message = build(:message)
      message.valid?
      expect(message).to be_valid
    end

  end
end
