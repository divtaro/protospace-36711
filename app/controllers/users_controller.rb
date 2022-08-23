class UsersController < ApplicationController
  def show
    # ユーザー名をクリックすることで、送られたidをparamsで取得し、そのユーザーのレコードをuserに代入
    @user = User.find(params[:id])
    # ↑ user → @userに変更するため、参照部分の全変更が必要
    
    @name = @user.name
    @prototypes = @user.prototypes
    @profile = @user.profile
    @occupation = @user.occupation
    @position = @user.position
  end
end