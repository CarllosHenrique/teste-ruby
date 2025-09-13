import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["toast"]

    connect() {
        this.timeout = setTimeout(() => this.close(), 3000)
    }

    disconnect() {
        clearTimeout(this.timeout)
    }

    close() {
        this.toastTarget.classList.add("opacity-0", "transition", "duration-500")
        setTimeout(() => this.toastTarget.remove(), 500)
    }
}
