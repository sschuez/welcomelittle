require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";
// import flatpickr from 'flatpickr';
// import flatpickr 'flatpickr/dist/flatpickr.min.css';

// flatpickr(".datepicker", {});

import { initSweetalert } from '../plugins/init_sweetalert';

initSweetalert('#sweet-alert-demo', {
  title: "Ihre Anfrage wurde erfolgreich übermittelt",
  text: "Wir werden diese sobald wie möglich prüfen und zeitnah kontakt mit ihnen aufnehmen. Vielen Dank.",
  button: "Zurück",
  icon: "success"
}, (value) => {
  if (value) {
    const link = document.querySelector('#delete-link');
    link.click();
  }
});

require("trix")
require("@rails/actiontext")