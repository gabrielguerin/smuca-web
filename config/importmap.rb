# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "tw-elements", to: "https://ga.jspm.io/npm:tw-elements@1.0.0-alpha12/dist/js/index.min.js"
pin "flowbite", to: "https://ga.jspm.io/npm:flowbite@1.4.2/dist/flowbite.js"
