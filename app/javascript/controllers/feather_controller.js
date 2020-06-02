import { Controller } from 'stimulus';
import feather from 'feather-icons';

export default class extends Controller {
  connect() {
    feather.replace();
  }
}
