import { Controller } from '@hotwired/stimulus';
import { enter, leave } from 'el-transition';

export default class extends Controller {
  connect() {
    enter(this.element);
    setTimeout(() => {
      this.dismiss();
    }, 4000);
  }

  dismiss() {
    leave(this.element).then(() => {
      this.element.remove();
    });
  }
}
