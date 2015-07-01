class NotesController < ApplicationController
	before_action :findNote, only: [:show, :edit, :update, :destroy]
	def index
		@notes = Note.all.order("created_at DESC")
	end

	def show
	end

	def new
		@note = Note.new
	end

	def create
		@note = Note.new(noteParams)

		if @note.save
			redirect_to @note
		else
			render 'new'
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def findNote
		@note = Note.find(params[:id])
	end

	def noteParams
		params.require(:note).permit(:title, :content)
	end
end
