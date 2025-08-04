class PrototypesController < ApplicationController
  def index
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


# private以下の記述はすべてプライベートメソッドになる
  private
  
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end


end
