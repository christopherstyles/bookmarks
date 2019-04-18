import { Controller } from 'stimulus';
import has from 'lodash/has';

export default class extends Controller {
  static targets = ['title', 'tagList', 'url', 'notes'];

  connect() {}

  async fetch(e) {
    e.preventDefault();

    const url = encodeURIComponent(this.urlTarget.value);

    $.getJSON(`/unfurls?url=${url}`, (data) => {
      console.log(data); // Data returned

      if (has(data, 'best_title')) {
        this.titleTarget.value = data.best_title;
      }

      if (has(data, 'best_description')) {
        this.notesTarget.value = data.best_description;
      }

      if (has(data, 'images.best')) {
      }

      if (has(data, 'meta_tags.name.keywords')) {
        const selectize = $(this.tagListTarget)[0].selectize;
        selectize.addItem(data.meta_tags.name.keywords);
      }
    });
  }
}
