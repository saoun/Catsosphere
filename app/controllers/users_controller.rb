class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def destroy
    User.destroy(params[:id])
    session[:user_id] = nil
    redirect_to(:back)
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to(:user)
  end

  private
    def user_params
    params[:user].permit(:name, :fullname, :contact, :bio, :avatar)
  end

  # def set_s3_direct_post
  #   @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
  # end
end
