import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    change(event) {
        const lang = event.currentTarget.dataset.lang;

        fetch("/locale/update", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').getAttribute('content')
            },
            body: JSON.stringify({ lang: lang })
        })
            .then(() => {
                window.location.reload();
            })
            .catch(error => console.error("Erro ao mudar o idioma:", error));
    }
}
