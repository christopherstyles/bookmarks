# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "stimulus-reveal-controller", to: "https://ga.jspm.io/npm:stimulus-reveal-controller@4.1.0/dist/stimulus-reveal-controller.mjs"
pin "@hotwired/stimulus", to: "https://ga.jspm.io/npm:@hotwired/stimulus@3.2.1/dist/stimulus.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "feather-icons", to: "https://ga.jspm.io/npm:feather-icons@4.29.0/dist/feather.js"
pin "simplemde", to: "https://cdn.jsdelivr.net/npm/simplemde@1.11.2/src/js/simplemde.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "tom-select", to: "https://ga.jspm.io/npm:tom-select@2.2.2/dist/js/tom-select.complete.js"
pin "lodash-es", to: "https://ga.jspm.io/npm:lodash-es@4.17.21/lodash.js"
