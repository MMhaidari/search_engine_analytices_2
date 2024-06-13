import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["input", "suggestions"]

  connect() {
    document.addEventListener('click', this.handleClickOutside.bind(this))
  }

  disconnect() {
    document.removeEventListener('click', this.handleClickOutside.bind(this))
  }

  handleClickOutside(event) {
    if (!this.element.contains(event.target)) {
      this.suggestionsTarget.classList.add('hidden')
    }
  }

  suggestions() {
    const query = this.inputTarget.value
    const url = this.element.dataset.suggestionsUrl
    clearTimeout(this.timeout)

    this.timeout = setTimeout(() => {
      this.requestSuggestions(query, url)
    }, 500)
  }

  requestSuggestions(query, url) {
    if (query.length === 0) {
      this.suggestionsTarget.classList.add('hidden')
      return
    } else {
      this.suggestionsTarget.classList.remove('hidden')
    }
    fetch(url, {
      method: "POST",
      headers: {
        "Content-Type": 'application/json',
        "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content
      },
      body: JSON.stringify({ query: query })
    }).then((res) => {
      res.text().then((html) => {
        this.suggestionsTarget.innerHTML = html
      })
    })
  }
}
