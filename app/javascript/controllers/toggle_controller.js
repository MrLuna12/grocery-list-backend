import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    PUT = 'put'

    submit(event) {
        let isChecked = event.target.checked
        let checkedAt = isChecked ? new Date() : null
        let grocery_list_item_path = event.params.url
        let csrfToken = document.querySelector('meta[name="csrf-token"]').content
        let params = {
            item: {checked_at: checkedAt}
        }

        fetch(grocery_list_item_path, {
            method: this.PUT,
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-Token': csrfToken
            },
            body: JSON.stringify(params)
        }).then(response => response)
            .catch(err => console.log(err))
    }
}
