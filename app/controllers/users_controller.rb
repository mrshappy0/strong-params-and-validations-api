class UsersController < ApplicationController

  def index
    @users = User.all 

    render json: @users 
  end

  def show
    @user = User.find(params[:id])

    render json: @user
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: @user.errors.messages
    end
  end
  
  def update
    @user = User.find(params[:id])
    @user.update 
    
    render json: @user 
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy 

    redirect_to action: "index"
  end

  private

  def user_params 
    params.require(:user).permit([:name, :username, :email, :password])
  end

end

# const newUser = {"user": {
#   "name": "Jared",
#   "username": "junior",
#   "email": "jared@mail.com",
#   "anotherone": "did it make it?",
#   "this_attribute": 
# }}


# fetch('http://localhost:3000/users', {
#   method: "POST",
#   headers: {
#     "Content-Type": "application/json"
#   },
#   body: JSON.stringify(newUser)
# })
# .then(response => response.json())
# .then(result => console.log(result))
