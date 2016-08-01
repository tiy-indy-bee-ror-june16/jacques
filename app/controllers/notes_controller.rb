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

  # POST /notes
  def create
    @note = current_user.notes.new(note_params)
    if params[:tags]
      params[:tags].split(",").map(&:strip).each do |name|
      @note.tags << Tag.find_or_initialize_by(name: name)
      end
    end
    if @note.save
      render json: @note, status: :created, location: @note
    else
      render json: @note.errors.full_messages, status: 400
    end
  end

  # PATCH/PUT /notes/1
  def update

    if params[:tags]
      @note.tags.delete_all
      params[:tags].split(",").map(&:strip).each do |name|
      @note.tags << Tag.find_or_initialize_by(name: name)
      end
    end

    if @note.update(note_params)
      render json: @note
    else
      render json: @note.errors.full_messages, status: :unprocessable_entity
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
      params.permit(:title, :body, :user_id, :note_image)
    end
end
