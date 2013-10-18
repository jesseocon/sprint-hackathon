
class BlastsController < ApplicationController
  def index
    @images = Image.all
    Pusher['test_channel'].trigger('greet', {
      :greeting => "Hello there!", pics: @images 
    })
  end
  def new

  end
  
  def show
    
  end
end
