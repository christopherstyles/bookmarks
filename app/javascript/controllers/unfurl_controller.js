import { Controller } from '@hotwired/stimulus';
import { extract } from 'https://unpkg.com/@extractus/article-extractor@latest/dist/article-extractor.esm.js';
import TurndownService from 'turndown';
import { gfm } from 'turndown-plugin-gfm';

export default class extends Controller {
  static targets = ['title', 'tagsList', 'url', 'notes'];

  connect() {}

  async fetch(e) {
    e.preventDefault();

    const turndownService = new TurndownService({
      headingStyle: 'atx',
      codeBlockStyle: 'fenced',
      emDelimiter: '*',
    });
    turndownService.use(gfm);

    let notes = '';

    const article = await this.loadFeed(this.urlTarget.value, false);

    if (this.hasNotesTarget) {
      notes = `
${'image' in article ? `![${article.title}](${article.image})` : ''}

# ${article.title}

Author: ${article.author}

Source: ${article.url}
Published: ${article.published}
Source: ${article.source}

Links:
${article.links.join('\n')}

> ${article.description}

${turndownService.turndown(article.content)}
`;

      this.dispatch('update.notes', { detail: { content: notes } });
    }

    if ('title' in article && this.hasTitleTarget) {
      this.dispatch('update.title', { detail: { title: article.title } });
    }

    console.log('got article:', article);
  }

  async loadFeed(url) {
    const data = await extract(url, {}, {});
    return Object.assign(Object.create(null), data); // use pure object to hold data
  }
}
