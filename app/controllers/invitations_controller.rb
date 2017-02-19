class InvitationsController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    user = User.find_by(name: params[:invitation][:user_name])
    invite = event.invitations.build(user_id: user.id)
    if invite.save
      flash[:success] = "Successfully invited #{user.name}"
      redirect_to event
    else
      flash[:danger] = "Could not invite #{user.name}: #{invite.errors.full_messages}"
      redirect_to event
    end
                        
    
  end
end
