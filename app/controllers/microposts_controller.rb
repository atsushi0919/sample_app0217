class MicropostsController < ApplicationController
  # ログインユーザーのみ作成/削除できる
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    # formで送った値をmicropost_paramsで受け取り current_userに渡して代入
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      render "static_pages/home"
    end
  end

  def destroy
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content)
  end
end
