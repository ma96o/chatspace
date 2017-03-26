json.set! :text, @message.text
json.set! :created_at, @message.created_at.strftime('%Y年%m月%d日 %H:%M:%S')
json.set! :image, @message.image.url
