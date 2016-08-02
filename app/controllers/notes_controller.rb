class NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :destroy]
  # before_action :require_user

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
      if params[:tags]
        params[:tags].split(",").map(&:strip).each do |name|
          @note.tags << Tag.find_or_initialize_by(name: name)
        end
      end
      render json: @note, status: :created, location: @note
    else
      render json: {errors: @note.errors.full_messages.map{|m| {error: m} }}, status: :bad_request
    end
  end

  # PATCH/PUT /notes/1
  def update
    if @note.update(note_params)
      render json: @note
    else
      render json: @note.errors, status: :unprocessable_entity
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
      params.permit(:title, :body, :photo)
    end

end
