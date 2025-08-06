class PrototypesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

  def index
 #すべてのプロトタイプ情報を代入
    @prototypes = Prototype.all
 #ユーザーネームの取得を許可
    if user_signed_in?
      @name = current_user.name
    else
      @name = "ゲスト"
    end
  end

  def new
    @prototype = Prototype.new
  end

    # Prototype.create(prototype_params)
    # redirect_to '/'
  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save 
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity # 新規投稿ページに戻る
    end
  end

# showアクション(詳細ページ)の定義
  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    # すべてのコメントの代入
    @comments = @prototype.comments.includes(:user)
  end

  
# editアクション(編集)の定義
  def edit
    @prototype = Prototype.find(params[:id])
    unless @prototype.user_id == current_user.id
      redirect_to root_path
    end
  end

# updateアクション(更新)の定義
 def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

# destroyアクション(削除)の定義
  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy
    redirect_to root_path
  end

# private以下の記述はすべてプライベートメソッドになる
  private
  
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end


end
