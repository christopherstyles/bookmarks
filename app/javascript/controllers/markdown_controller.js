import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['textarea'];

  connect() {
    this.editor = new SimpleMDE({
      autoDownloadFontAwesome: true,
      element: this.textareaTarget,
      indentWithTabs: false,
      renderingConfig: {
        codeSyntaxHighlighting: true,
      },
    });
  }

  disconnect() {
    this.editor.toTextArea();
    this.editor = null;
  }
}
