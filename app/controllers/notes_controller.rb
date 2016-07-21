class NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :destroy]

  # GET /notes
  def index
    @notes = Note.all

    render json: @notes
  end

  # GET /notes/1
  def show
    render json: @note
  end

  # POST /notes
  def create
    @note = Note.new(note_params)

    if @note.save
     params[:tags].split(",").map(&:strip).map{|tag| @note.tags << (Tag.find_or_create_by(name: tag))}
      render json: @note, status: :created, location: @note
    else
      render json: {errors: @note.errors.full_messages.map{|message| {error: message}}}, status: 400
    end
  end

  # PATCH/PUT /notes/1
  def update
    if @note.update(note_params)
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
      params.permit(:title, :body)
    end
end
