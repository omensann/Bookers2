class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id #book modelのuser_idにログイン中のuserのidを加える
    if @book.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to  book_path(@book.id)
    else

      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all

  end

  def show
    @books = Book.all
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :profile_image)
  end
end