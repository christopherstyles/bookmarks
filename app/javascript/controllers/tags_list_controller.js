import { Controller } from '@hotwired/stimulus';
import TomSelect from 'tom-select';

export default class extends Controller {
  static values = {
    autocompleteUrl: String,
    options: { type: Object, default: {} },
  };

  connect() {
    new TomSelect(this.element, {
      ...this.defaultOptions,
      ...this.optionsValue,
    });
  }

  get defaultOptions() {
    return {
      closeAfterSelect: true,
      createOnBlur: true,
      create: true,
      labelField: 'name',
      load: (query, callback) => {
        const url = `${this.autocompleteUrlValue}?q=${encodeURIComponent(
          query,
        )}`;
        fetch(url)
          .then((response) => response.json())
          .then((json) => {
            callback(json);
          })
          .catch(() => {
            callback();
          });
      },
      persist: false,
      placeholder: 'Add a tag',
      plugins: ['caret_position'],
      searchField: 'name',
      selectOnTab: true,
      sortField: {
        field: 'name',
        direction: 'asc',
      },
      valueField: 'name',
    };
  }
}
