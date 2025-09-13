import { Controller } from "@hotwired/stimulus"
import Swal from "sweetalert2"

export default class extends Controller {
    confirmDestroy(event) {
        event.preventDefault();

        const button = event.currentTarget;

        const title = button.dataset.confirmTitle;
        const text = button.dataset.confirmText;
        const confirmButtonText = button.dataset.confirmButton;
        const cancelButtonText = button.dataset.cancelButton;

        Swal.fire({
            title: title,
            text: text,
            icon: "warning",
            showCancelButton: true,
            buttonsStyling: false,
            customClass: {
                confirmButton:
                    "px-4 py-2 rounded-lg bg-red-600 text-white hover:bg-red-700 text-sm mx-2",
                cancelButton:
                    "px-4 py-2 rounded-lg border border-gray-300 hover:bg-gray-100 text-sm mx-2",
            },
            confirmButtonText: confirmButtonText,
            cancelButtonText: cancelButtonText
        }).then((result) => {
            if (result.isConfirmed) {
                button.form.requestSubmit();
            }
        });
    }
}
