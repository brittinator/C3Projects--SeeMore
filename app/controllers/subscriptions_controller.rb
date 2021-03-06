class SubscriptionsController < ApplicationController
  def create
    followee = Followee.find_or_create_by(followee_params)
    Subscription.find_or_create_subscription(@current_user, followee)

    redirect_to :back, notice: "You have successfully subscribed to '@#{followee.handle}'!"

    rescue
      redirect_to root_path
  end

  def index
    active_subscriptions = @current_user.subscriptions.active
    @followees = find_followees(active_subscriptions)
  end

  def find_followees(subscriptions)
    @followees = []
    subscriptions.map { |subscription| subscription.followee }
  end

  def unsubscribe
    # adds current time to unsubscribe_date
    subscription = Subscription.find(params[:id])
    subscription.update!(unsubscribe_date: Time.now)
    redirect_to :back, notice: "You have successfully unsubscribed from @#{subscription.followee.handle}."

    rescue
      redirect_to root_path
  end

  private

  def sub_params
    params.require(:subscriptions).permit(:id, :user_id, :followee_id)
  end

  def followee_params
    { source: params[:source],
      username: params[:username],
      id: params[:id],
      picture: params[:profile_picture],
      avatar_url: params[:avatar_url]
    }
  end
end
