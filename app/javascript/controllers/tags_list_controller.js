import { Controller } from '@hotwired/stimulus';
import TomSelect from 'tom-select';

export default class extends Controller {
  static values = {
    autocompleteUrl: String,
    options: { type: Object, default: {} },
    placeholder: { type: String, default: 'Add a tag' },
    queryParam: { type: String, default: 'q' },
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
        const url = `${this.autocompleteUrlValue}?${
          this.queryParamValue
        }=${encodeURIComponent(query)}`;
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
      placeholder: this.placeholderValue,
      plugins: ['caret_position', 'remove_button'],
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
