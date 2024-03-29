# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "stimulus-reveal-controller", to: "https://ga.jspm.io/npm:stimulus-reveal-controller@4.1.0/dist/stimulus-reveal-controller.mjs"
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "feather-icons", to: "https://ga.jspm.io/npm:feather-icons@4.29.0/dist/feather.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "tom-select", to: "https://ga.jspm.io/npm:tom-select@2.2.2/dist/js/tom-select.complete.js"
pin "lodash-es", to: "https://ga.jspm.io/npm:lodash-es@4.17.21/lodash.js"
pin "el-transition", to: "https://ga.jspm.io/npm:el-transition@0.0.7/index.js"
pin "turndown", to: "https://ga.jspm.io/npm:turndown@7.1.2/lib/turndown.browser.es.js"
pin "turndown-plugin-gfm", to: "https://ga.jspm.io/npm:turndown-plugin-gfm@1.0.2/lib/turndown-plugin-gfm.cjs.js"
