class PrototypesController < ApplicationController
  def index
 #ユーザーネームの取得を許可
    if user_signed_in?
      @name = current_user.name
    else
      @name = "ゲスト"
    end
  end

end
