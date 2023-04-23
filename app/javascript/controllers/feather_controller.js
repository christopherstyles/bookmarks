import { Controller } from '@hotwired/stimulus';
import feather from 'feather-icons';

export default class extends Controller {
  connect() {
    feather.replace();
  }
}
