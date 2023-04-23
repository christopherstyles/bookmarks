import { Controller } from '@hotwired/stimulus';
import { has, trim } from 'lodash-es';

export default class extends Controller {
  static targets = ['title', 'tagsList', 'url', 'notes'];

  connect() {}

  async fetch(e) {
    e.preventDefault();

    const url = encodeURIComponent(this.urlTarget.value);
    const editor = $(this.notesTarget).data('editor');

    $.getJSON(`/unfurls?url=${url}`, (data) => {
      if (has(data, 'best_title')) {
        this.titleTarget.value = data.best_title;
      }

      if (has(data, 'best_description')) {
        editor.value(data.best_description);
      }

      if (has(data, 'images.best')) {
        editor.value(`![](${data.images[0]})` + '\n\n' + editor.value());
      } else if (has(data, "meta_tags.property['og:image']")) {
        editor.value(
          `![](${data.meta_tags.property['og:image']})` +
            '\n\n' +
            editor.value(),
        );
      }

      if (has(data, 'meta_tags.name.keywords[0]')) {
        const selectize = $(this.tagsListTarget)[0].selectize;
        const keywords = data.meta_tags.name.keywords[0].split(',');

        keywords.map((keyword) => {
          const name = trim(keyword).toLowerCase();
          selectize.addOption({ name });
          selectize.addItem(name);
          selectize.refreshItems();
        });
      }
    });
  }
}
