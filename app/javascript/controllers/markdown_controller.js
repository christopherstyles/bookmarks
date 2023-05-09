import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['textarea'];

  static values = {
    options: { type: Object, default: {} },
  };

  connect() {
    this.editor = new EasyMDE({
      ...this.defaultOptions,
      ...this.optionsValue,
    });
  }

  disconnect() {
    this.editor.toTextArea();
    this.editor = null;
  }

  updateContent({ detail: { content } }) {
    console.log('updateContent', content);
    this.editor.value(content);
  }

  /**
   * Generate a random string of letters; used to generate a unique ID
   * for each editor.
   */
  generateId(length = 6) {
    let result = '';
    const characters =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    const charactersLength = characters.length;
    let counter = 0;
    while (counter < length) {
      result += characters.charAt(Math.floor(Math.random() * charactersLength));
      counter += 1;
    }
    return result;
  }

  get defaultOptions() {
    return {
      autoDownloadFontAwesome: true,
      autoSave: true,
      element: this.textareaTarget,
      indentWithTabs: false,
      renderingConfig: {
        codeSyntaxHighlighting: true,
      },
      uniqueId: `notes-${this.generateId(6)}`,
    };
  }
}
