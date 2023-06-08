import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="price"
export default class extends Controller {
  static targets = ["price", "startDate", "endDate", "submit"]
  connect() {
    console.log("price controller")
  }

  updatePrice(e) {
    const startDate = new Date(this.startDateTarget.value)
    const endDate = new Date(this.endDateTarget.value)

    const total_days = ((endDate.getTime() - startDate.getTime()) / (1000 * 3600 * 24) + 1)
    const dailyPrice = Number.parseInt(this.priceTarget.innerText, 10)
    const totalPrice = total_days * dailyPrice
    console.log(total_days)
    console.log(startDate)
    if (total_days <= 0 ) {
      this.submitTarget.disabled = true
      console.log(this.submitTarget)
    } else if (startDate < new Date() || startDate > endDate) {
      this.submitTarget.disabled = true
    } else {
      this.submitTarget.removeAttribute("disabled")
      const totalPriceField = `
        €<input id="total-price" class="border-0 bg-transparent" type="text" value="${totalPrice.toFixed(2)}" disabled>
      `;
      if (this.element.querySelector("#total-price")) {
        this.element.querySelector("#total-price").value = totalPrice
      }
      else {
        this.element.insertAdjacentHTML("beforeend", totalPriceField)
      }
    }
  }
}
