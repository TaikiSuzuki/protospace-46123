class UsersController < ApplicationController

# showアクション(詳細ページ)の定義
  def show
    @user = User.find(params[:id])
  end
end
