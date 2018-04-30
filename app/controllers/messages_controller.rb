class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.request = request
      if @message.deliver
        flash[:notice] = "Thanks!  We have received your message and will be in touch soon."
      else
        flash[:danger] = "There was an error in sending your message.  Please try again."
        render :new
      end
  end

  private
    def message_params
      params.require(:message).permit(:name, :phone_number, :body)
    end
end
