class FavoritesController < ApplicationController
	def create
		book = Book.find(params[:book_id])
		favorite = current_user.favorites.new(book_id: book.id)
    	favorite.save
    	redirect_to request.referrer
	end

	def destroy
		book = Book.find(params[:book_id])
		favorite = current_user.favorites.find_by(book_id: book.id)
		favorite.destroy
		redirect_to request.referrer
		# redirectメソッドを使う時は
		# book_path(book)
	end

# private
    # def redirect
    	# case params[:redirect_id].to_i 
    	# when 0
    	   	# redirect_to books_path 
    	# when 1
    	   	# redirect_to book_path(@book)
        # end
    # end

end

