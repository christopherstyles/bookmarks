import { Controller } from '@hotwired/stimulus';
import { leave, toggle } from 'el-transition';

export default class extends Controller {
  static targets = ['menu', 'trigger'];

  toggle() {
    toggle(this.menuTarget);
  }

  hide(event) {
    const triggerClicked = this.triggerTarget.contains(event.target);

    if (!triggerClicked) {
      leave(this.menuTarget);
    }
  }
}
