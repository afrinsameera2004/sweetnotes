
import "@hotwired/turbo-rails"


import ClassicEditor from "@ckeditor/ckeditor5-build-classic"



document.addEventListener("turbo:load", () => {
  const contentField = document.querySelector("#note_content")
  if (contentField) {
    ClassicEditor.create(contentField).catch(error => {
      console.error("CKEditor error:", error)
    })
  }
})
