class MessagesController < ApplicationController
before_action :authenticate_user!, :only => [:create]

def create
@message = Message.new(message_params)
@message.user_id = current_user.id
if @message.save
redirect_to room_path(@message.room)
else
redirect_back(fallback_location: root_path)
end
end

private
def message_params
params.require(:message).permit(:user_id, :body, :room_id).merge(user_id: current_user.id)
end
end