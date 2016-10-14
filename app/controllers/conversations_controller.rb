class ConversationsController < ApplicationController
  # before_action :authenticate_user

def index
  @users = User.all
  @conversations = Conversation.all
 end

def create
  data = params

  if Conversation.between(current_user.id,params[:recipient_id])
   .present?
    @conversation = Conversation.between(current_user.id,
     params[:recipient_id]).first

 else
    @conversation = Conversation.create!(conversation_params(data))
 end

  redirect_to conversation_messages_path(@conversation)
end


private
  def conversation_params data

    params = ActionController::Parameters.new({
      conversation: {
        sender_id: current_user.id,
        recipient_id: data[:recipient_id].to_i
      }
      })

    params.require(:conversation).permit(:sender_id, :recipient_id)
  end
end
