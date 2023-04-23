// Load all the controllers within this directory and all subdirectories.
// Controller files must be named *_controller.js.

import { application } from 'controllers/application';

import { eagerLoadControllersFrom } from '@hotwired/stimulus-loading';
eagerLoadControllersFrom('controllers', application);
