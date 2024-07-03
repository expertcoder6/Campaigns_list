class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  def ui_view
  end

  def index
    @users = User.all
    render json: {users:@users}
  end

  def create
    @user = User.new(user_params.merge(campaigns_list: (params[:campaigns_list].is_a?(String) ? JSON.parse(params[:campaigns_list]) : params[:campaigns_list]).as_json))
    if @user.save
      render json: {user:@user}, status: :created
    else
      render json: {error: @user.errors}, status: :unprocessable_entity
    end
  end

  def filter

    campaign_names = params[:filter].split(',') || []
    conditions = campaign_names.map { |name| "JSON_CONTAINS(campaigns_list, ?, '$')" }.join(' OR ')
    values = campaign_names.map { |name| [{ campaign_name: name }].to_json }
    @users = User.where(conditions, *values)
    render json: { users: @users }
  end

  private
  def user_params
    params.permit(:name, :email,campaigns_list:[])
  end
end
