import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-amount"
export default class extends Controller {
  static targets = ["text", "price", "value"]

  connect() {
    console.log("test")
  }

  calculateValue(event) {
    let total_value = event.currentTarget.value * this.priceTarget.innerHTML
    this.textTarget.innerText = total_value.toFixed(2)
    this.valueTarget.value = total_value.toFixed(2)
  }
}
