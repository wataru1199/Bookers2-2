class BookCommentsController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book.id
    comment.save
    @book = Book.find(params[:book_id])
    @book_comment = BookComment.new

  end

  def destroy
    #byebug
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy 
    #id: params[:id], book_id: params[:book_id]の情報はlink_toでの引数で渡しているため
    #削除を押した時点で情報は特定できている、どちらかの情報を渡すだけでrailsが勝手に読み込む
    @book = Book.find(params[:book_id])
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
