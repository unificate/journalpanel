// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

document.addEventListener('turbolinks:load', () => {
    $("#dropdownMenuButton").dropdown();
});


// import {MDCMenu} from '@material/menu';
// import {MDCRipple} from '@material/ripple';

// document.addEventListener('turbolinks:load', () => {
//     const userButton = new MDCRipple(document.querySelector('#user-button'));
//     const menu = new MDCMenu(document.querySelector('#user-menu'));
//     userButton.root_.onclick = () => {
//         menu.open = true;
//     };

//     const logout = new MDCRipple(document.querySelector('#logout'));
//     logout.root_.onclick = () => {
//         const xhttp = new XMLHttpRequest();
//         xhttp.onload = () => {
//             if (xhttp.status == 204) {
//                 location.href = "/";
//             }
//         }


//         xhttp.open('DELETE', '/users/sign_out');
//         const token = document.getElementsByName("csrf-token");
//         if (token.length > 0) {
//             xhttp.setRequestHeader('X-CSRF-Token', token[0].content);
//         }
//         xhttp.send();
//     };
// });

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
