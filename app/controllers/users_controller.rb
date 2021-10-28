# frozen_string_literal: true

class UsersController < ApplicationController
  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    @users = User.find_by(id: params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Create account sucessfully'
      redirect_to users_path
    else
      flash[:succerss] = 'Create account failed'
      render 'new'
    end
  end
end

# PATCH/PUT /users/1 or /users/1.json
def update
  if @user.update(user_params)
    flash[:success] = 'User was successfully updated'
    redirect_to @user
  else
    render 'edit'
  end
end

# DELETE /users/1 or /users/1.json
def destroy
  @user.destroy
  flash[:success] = 'User was successfully updated'
  redirect_to users_url
end

private
# Only allow a list of trusted parameters through.
def user_params
  params.require(:user).permit :name, :email, :password, :password_confirmation
end
