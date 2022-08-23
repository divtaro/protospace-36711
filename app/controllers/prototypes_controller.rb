class PrototypesController < ApplicationController
  # ↓ この場所にこの記述がされていると、ログイン/ログアウトに関わらず、トップページが表示されない。
  # before_action :authenticate_user!

  # ↓ ただし、exceptで一部のアクションを対象から除外すれば、そのアクションは表示される。
  before_action :authenticate_user! ,except: [:index, :show]

  def index
    @prototypes = Prototype.all.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.create(prototype_params)
    
    if @prototype.save
      redirect_to root_path(@prototype)
    else
      render :new
    end
  end

  def edit
    @prototype = Prototype.find(params[:id])

    # 投稿者以外がeditアクションにアクセスした場合に直す
    unless @prototype.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      # redirect_to prototype_path ←この表記だと、異なるデータが送られるなどの余計なエラーを予防できる
      redirect_to prototype_path(@prototype)
    else
      # redirect_to action: :edit
      render :edit
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    if prototype.destroy
      redirect_to root_path(prototype)
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)

    # @user = User.find(params[:id])
    # @name = @user.name
  end


  private

  def prototype_params
    # params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end 

  # def set_prototype
  #   @prototype = Prototype.find(params[:id])
  # end

  def move_to_index
    unless user_signed_in?
    redirect_to action: :index
    end
  end
end