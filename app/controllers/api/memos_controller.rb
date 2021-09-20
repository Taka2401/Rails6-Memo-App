class Api::MemosController < ApplicationController
  def index
    @memos = Memo.order('created_at DESC')
  end

  def create
    @memo = Memo.new(memo_params)
    if @memo.save
      # 投稿出来たらcreatedのステータスを付与
      render :show, status: :created
    else
      # 投稿出来なかった場合エラーを出す。
      render json: @memo.errors, status: :unprocessable_entity
    end
  end

  private
    def memo_params
      params.permit(:title, :discription)
    end
end
