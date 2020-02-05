import { Controller } from 'stimulus';

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
      openOnFocus: false,
      hideSelected: true,
      closeAfterSelect: true,
      options: JSON.parse(this.data.get('options')),
    });
  }
}
