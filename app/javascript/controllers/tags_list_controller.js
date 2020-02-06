import { Controller } from 'stimulus';
import $ from 'jquery';
import 'selectize/dist/js/standalone/selectize';

export default class extends Controller {
  static targets = ['input'];

  connect() {
    $(this.inputTarget).selectize({
      delimiter: ',',
      persist: false,
      create: function(input) {
        return {
          id: input,
          name: input,
        };
      },
      valueField: 'name',
      labelField: 'name',
      searchField: 'name',
      selectOnTab: true,
      openOnFocus: false,
      hideSelected: true,
      closeAfterSelect: true,
      options: JSON.parse(this.data.get('options')),
    });
  }
}
