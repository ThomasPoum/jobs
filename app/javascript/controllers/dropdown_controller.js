import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "items" ]
  
  menu() {
    const el = this.itemsTarget
    el.classList.toggle('hidden') 
    this.preventDefault()
  }
  
}