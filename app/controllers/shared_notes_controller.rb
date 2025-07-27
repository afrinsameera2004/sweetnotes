
class SharedNotesController < ApplicationController
  before_action :set_note

  def create
    shared_user = User.find_by(email: params[:email])

    if shared_user.nil?
      redirect_to @note, alert: "User with that email was not found."
      return
    end

    @shared_note = SharedNote.new(
      note: @note,
      user: shared_user,
      editable: params[:editable].present?
    )

    if @shared_note.save
      redirect_to @note, notice: "Note successfully shared."
    else
      redirect_to @note, alert: "Failed to share note: #{@shared_note.errors.full_messages.to_sentence}"
    end
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end
end
