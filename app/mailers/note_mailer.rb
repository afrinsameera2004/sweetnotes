
class NoteMailer < ApplicationMailer
  default from: "afrinsameera2004@gmail.com"

  def share_note_email(shared_note)
    @shared_note = shared_note
    @note = shared_note.note
    @owner = @note.user # ✅ Get the user from the note, not from shared_note
    @url = note_url(@note)

    mail(
      to: @shared_note.shared_with_email,
      subject: "SweetNotes: A note was shared with you by #{@owner.email}"
    )
  end
end
