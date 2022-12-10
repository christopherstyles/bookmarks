import { Turbo } from '@hotwired/turbo-rails';
import '@hotwired/turbo-rails';
import 'bootstrap';

import 'core-js/stable';
import 'regenerator-runtime/runtime';

import './controllers';

window.Turbo = Turbo;
window.Turbo.setProgressBarDelay(1);
