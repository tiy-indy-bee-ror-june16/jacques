class NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :destroy]
  before_action :require_user, only: [:create, :update, :destroy]

  # GET /notes
  def index
    if current_user
      @notes = current_user.notes
    else
      @notes = Note.all
    end
    render json: @notes
  end

  # GET /notes/1
  def show
    render json: @note
  end

  def count
    render json: Note.count
  end

  # POST /notes
  def create
    @note = current_user.notes.new(note_params)

    if @note.save
     params[:tags].split(",").map(&:strip).each{|tag| @note.tags << Tag.find_or_initialize_by(name: tag)}
      render json: @note, status: :created, location: @note
    else
      render json: {errors: @note.errors.full_messages.map{|message| {error: message}}}, status: 400
    end
  end

  # PATCH/PUT /notes/1
  def update
    if @note.update(note_params)
      @note.tags.delete_all
      params[:tags].split(",").map(&:strip).each{|tag| @note.tags << Tag.find_or_initialize_by(name: tag)}
      render json: @note
    else
      render json: {errors: @note.errors.full_messages.map{|message| {error: message}}}, status: 400
    end
  end

  # DELETE /notes/1
  def destroy
    @note.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def note_params
      params.permit(:title, :body, :tag_string)
    end
end
