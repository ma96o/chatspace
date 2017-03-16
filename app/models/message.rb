class Message < ApplicationRecord
  belongs_to :messageable, polymophic: true
end
