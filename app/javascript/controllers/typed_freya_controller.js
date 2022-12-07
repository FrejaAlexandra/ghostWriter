import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    console.log("bjcwkdcw")
    new Typed(this.element, {
      strings: [" When you self-publish a book, you control what's in it. You control how long it is. And you control how it looks. Of course, if your book isn't good, you have no editor or editorial board to blame."],
      typeSpeed: 80,
      loop: true
    })
  }
}
