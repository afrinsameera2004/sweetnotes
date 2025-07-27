
class NotesController < ApplicationController 
  before_action :authenticate_user!
  before_action :set_note, only: %i[ show edit update destroy share archive unarchive ]

  # GET /notes
  def index
    notes = current_user.notes.where(archived: [false, nil]) # Archived is false or null

    if params[:tag].present?
      notes = notes.select { |note| note.tag_array.include?(params[:tag]) }
    end

    if params[:search].present?
      keyword = params[:search].downcase
      notes = notes.select do |note|
        note.title.to_s.downcase.include?(keyword) || note.content.to_s.downcase.include?(keyword)
      end
    end

    @notes = Kaminari.paginate_array(notes).page(params[:page]).per(5)
  end

  # GET /notes/archived
  def archived
    @notes = current_user.notes.where(archived: true)
  end

  # PATCH /notes/:id/archive
  def archive
    if @note.update(archived: true)
      redirect_to notes_path, notice: "Note archived successfully."
    else
      redirect_to notes_path, alert: "Failed to archive the note."
    end
  end

  # PATCH /notes/:id/unarchive
  def unarchive
    if @note.update(archived: false)
      redirect_to archived_notes_path, notice: "Note unarchived successfully."
    else
      redirect_to archived_notes_path, alert: "Failed to unarchive the note."
    end
  end

  # GET /notes/1
  def show; end

  # GET /notes/new
  def new
    @note = current_user.notes.build
  end

  # GET /notes/1/edit
  def edit; end

  # POST /notes
  def create
    @note = current_user.notes.build(note_params)

    if @note.save
      redirect_to @note, notice: "Note was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notes/1
  def update
    if @note.update(note_params)
      redirect_to @note, notice: "Note was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /notes/1
  def destroy
    @note.destroy
    redirect_to notes_path, notice: "Note was successfully destroyed."
  end

  # POST /notes/:id/share
  def share
    shared_email = params[:email].to_s.strip
    can_edit = params[:can_edit].to_s == "1"

    if shared_email.blank?
      redirect_to @note, alert: "Email can't be blank."
      return
    end

    shared_note = @note.shared_notes.create!(
      shared_with_email: shared_email,
      can_edit: can_edit,
      user: current_user
    )

    NoteMailer.share_note_email(shared_note).deliver_now
    redirect_to @note, notice: "Note shared with #{shared_email}"
  rescue => e
    redirect_to @note, alert: "Failed to share note: #{e.message}"
  end

  private

    def set_note
      @note = current_user.notes.find(params[:id])
    end

    def note_params
      params.require(:note).permit(
        :title, :content, :category, :priority, :important,
        :tags, files: []
      )
    end
end
