class NotesController < ApplicationController
	before_action :findNote, only: [:show, :edit, :update, :destroy]
	def index
		# optional check for personal feed
		# @notes = Note.where(user_id: current_user).order("created_at DESC")
		@notes = Note.all.order("created_at DESC")
	end

	def show
	end

	def new
		@note = current_user.notes.build
	end

	def create
		@note = @note = current_user.notes.build(noteParams)

		if @note.save
			redirect_to @note
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @note.update(noteParams)
			redirect_to @note
		else 
			render 'edit'
		end
	end

	def destroy
		@note.destroy
		redirect_to notes_path
	end

	private

	def findNote
		@note = Note.find(params[:id])
	end

	def noteParams
		params.require(:note).permit(:title, :content)
	end
end
