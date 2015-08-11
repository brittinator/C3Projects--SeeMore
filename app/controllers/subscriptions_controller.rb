class SubscriptionsController < ApplicationController
  before_action :current_user

  def new; end
    # do we need this?

  def create
    followee = Followee.find_or_create_by(followee_params)
    Subscription.find_or_create_subscription(@current_user, followee)

    redirect_to root_path
  end

  def index
    @subscriptions = @current_user.followees
  end

  def unsubscribe
    # adds current time to unsubscribe_date
    subscription = Subscription.find(params[:id])
    subscription.update!(unsubscribe_date: Time.now)
    redirect_to subscriptions_path
  end

  private

  def sub_params
    params.require(:subscriptions).permit(:id, :user_id, :followee_id)
  end

  def followee_params
    { source: params[:source],
      username: params[:username],
      id: params[:id],
      picture: params[:profile_picture]
    }
  end
end
