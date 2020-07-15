# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]
  def index
    @books = Book.all
  end

  def show
    @book = Book.find_by(id: params[:id])
    render action: 'index' if @book.nil?
  end

  def new
    @book = Book.new
  end

  def edit; end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = t 'flash.create'
      redirect_to @book
    else
      render :new
    end
  end

  def update
    if @book.update(book_params)
      flash[:notice] = t 'flash.update'
      redirect_to @book
    else
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    flash[:notice] = t 'flash.destroy'
    redirect_to('/books')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def book_params
    params.require(:book).permit(:title, :memo, :picture)
  end
end
