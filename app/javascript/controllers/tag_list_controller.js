import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tag-list"
export default class extends Controller {
  static targets = ["checkbox"]

  connect() {
    console.log("tags")
  }

  toggleActive(event) {
    // console.log(this.element)
    // this.checkboxTarget.classList.add("tag-active")
  }
}
