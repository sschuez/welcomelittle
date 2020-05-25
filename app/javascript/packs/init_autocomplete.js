import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('place-address');
  if (addressInput) {
    places({ container: addressInput }).configure(reconfigurableOptions);
  }
};

const reconfigurableOptions = {
  language: 'de', // Receives results in German
  // type: 'city', // Search only for cities names
  // aroundLatLngViaIP: false // disable the extra search/boost around the source IP
};
// const placesInstance = places(fixedOptions).configure(reconfigurableOptions);


export { initAutocomplete };