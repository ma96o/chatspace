json.array! @messages do |message|
  json.id message.id
  json.text message.text
  json.image message.image.url
  json.created_at message.created_at.strftime('%Y年%m月%d日 %H:%M:%S')
end
