require 'rest_client'
class ImagesController < ApplicationController
  respond_to :json
  
  def index
    @images = Image.all
  end
  
  def new
    
  end
  
  def create
    @image = Image.new()
    if params['img_url'][0..3] == 'data'
      arr = params['img_url'].split(',')
      type = arr[0].gsub(/data:/, '').gsub(/;base64/, '')
      data = arr[1]
      name = SecureRandom.hex
      @image.save_photo(name, type, data)
      if @image.save
        Pusher['test_channel'].trigger('greet', {
          :greeting => "Hello there!", image: @image, image_url: @image.pic.url 
        })
        respond_with(@image)
      else
        respond_with(@image.errors.full_messages)
      end
    else params['img_url']
      @image.img_url = params['img_url']
      @image.pic_from_url(@image.img_url)
      if @image.save

        Pusher['test_channel'].trigger('greet', {
          :greeting => "Hello there!", image: @image, image_url: @image.pic.url 
        })
        respond_with(@image)
      else
        respond_with(@image.errors.full_messages)
      end
    end
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def show
    
  end
  
  def destroy
    
  end

end























#content_url = CGI.escape(params['img_url'])

### credentials

#Client id 1383
# Secret token dcb7872095eb4650c3818088062bbaa6
# mms campaign id 29702

# shortcode 343434


#RestClient.get("https://api.mogreet.com/moms/transaction.send?client_id=1383&token=dcb7872095eb4650c3818088062bbaa6&campaign_id=29702&to=8582005141&message=this%20is%20the%20message&content_url=#{content_url}&format=json")