import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['title'];

  updateTitle({ detail: { title } }) {
    this.titleTarget.value = title;
  }
}
