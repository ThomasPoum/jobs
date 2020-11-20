import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "email", "resume" ]
  
  writeError(event) {
    const el = this.emailTarget
    const il = this.resumeTarget


    const la = document.getElementById('email').value
    if (la == "") {
      el.classList.remove('hidden')
      event.preventDefault()
    } else {
      el.classList.add('hidden')
    }
    
    const li = document.getElementById('resume').value
    if (li == "") {
      il.classList.remove('hidden')
      event.preventDefault()
    } else {
      il.classList.add('hidden')
    }
  }
  

}