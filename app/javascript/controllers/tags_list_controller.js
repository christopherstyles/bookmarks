import { Controller } from 'stimulus';
import qs from 'qs';

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
      load: (query, callback) => {
        if (!query.length) return callback();
        Rails.ajax({
          url: this.data.get('autocomplete-url'),
          type: 'GET',
          data: qs.stringify({
            q: query,
          }),
          error: () => {
            callback();
          },
          success: (res) => {
            callback(res.tags);
          },
        });
      },
    });
  }
}
