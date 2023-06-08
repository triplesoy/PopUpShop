import { Controller } from "@hotwired/stimulus"
import { end } from "@popperjs/core"

// Connects to data-controller="price"
  export default class extends Controller {
    static targets = ["price", "startDate", "endDate", "submit"]
  connect() {
  }

  updatePrice(e) {
    const startDate = new Date(this.startDateTarget.value)
    const endDate = new Date(this.endDateTarget.value)
    const today  = new Date()
    const total_days = ((endDate.getTime() - startDate.getTime()) / (1000 * 3600 * 24) + 1)
    const dailyPrice = Number.parseInt(this.priceTarget.innerText, 10)
    const totalPrice = total_days * dailyPrice

    const isStartDateValid = true;
    const isEndDateValid = startDate <= endDate;

    const isDisabled = !isStartDateValid || !isEndDateValid;
    this.submitTarget.disabled = isDisabled;

    const totalPriceField = `
      €<input id="total-price" class="border-0 bg-transparent" type="text" value="${totalPrice.toFixed(2)}" disabled>
    `;
    if (this.element.querySelector("#total-price")) {
      this.element.querySelector("#total-price").value = totalPrice;
    } else {
      this.element.insertAdjacentHTML("beforeend", totalPriceField);
    }

    if (!isDisabled) {
      this.submitTarget.removeAttribute("disabled");
    }
  }
  }
