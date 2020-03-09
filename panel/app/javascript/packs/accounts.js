// document.addEventListener('turbolinks:load', () => {
//     const newUserButton = document.getElementById("create-button");
//     const username = document.getElementById("username");
//     const password = document.getElementById("password");

//     console.log("Created listner2");

//     // New user is submitted
//     newUserButton.onclick = () => {
//         const role = getButtonValue();
//         const xhttp = new XMLHttpRequest();
//         xhttp.open('POST', 'users');
//         xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
//         const token = document.getElementsByName("csrf-token");
//         if (token.length > 0) {
//             xhttp.setRequestHeader('X-CSRF-Token', token[0].content);
//         }
//         // Create new user in db
//         xhttp.send('user[username]=' + username.value + '&user[password]=' + password.value + '&user[role]=' + role);
//         console.log(username.value + "!" + role);
//     };
// });

// import {MDCFormField} from '@material/form-field';
// import {MDCMenu} from '@material/menu';
// import {MDCRadio} from '@material/radio';
// import {MDCRipple} from '@material/ripple';
// import {MDCTextField} from '@material/textfield';

// document.addEventListener('turbolinks:load', () => {
//     for (let radioElement of document.querySelectorAll('.mdc-radio')) {
//         const radio = new MDCRadio(radioElement);
//         const formField = new MDCFormField(radioElement.parentElement);
//         formField.input = radio;
//     }
//     for (let textField of document.querySelectorAll('.mdc-text-field')) {
//         new MDCTextField(textField);
//     }
//     const create = new MDCRipple(document.querySelector('#create-button'));
//     create.root_.onclick = () => {
// 	const buttonValue = getButtonValue();
//         const xhttp = new XMLHttpRequest();
//         xhttp.onload = () => {
//             if (xhttp.status == 200) {
//                 location.reload()
//             }
//         }

//         xhttp.open('POST', 'users');
//         xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
//         const token = document.getElementsByName("csrf-token");
//         if (token.length > 0) {
//             xhttp.setRequestHeader('X-CSRF-Token', token[0].content);
//         }
//         xhttp.send('user[username]=' + username.value + '&user[password]=' + password.value + '&user[role]=' + buttonValue);
//     }
//     for (let i = 0;; i++) {
//         if (!document.getElementById("radio-admin-" + i)) {
//             break;
//         }
//         const user = document.querySelector("#user-" + i).textContent;
//         document.querySelector("#radio-admin-" + i).onclick = () => {
//             setUserRole(user, "Admin");
//         };
//         document.querySelector("#radio-developer-" + i).onclick = () => {
//             setUserRole(user, "Developer");
//         };
//         document.querySelector("#radio-productowner-" + i).onclick = () => {
//             setUserRole(user, "Product Owner");
//         };
//         document.querySelector("#radio-releasemanager-" + i).onclick = () => {
//             setUserRole(user, "Release Manager");
//         };
//         const menu = new MDCMenu(document.querySelector('#more-menu-' + i));
//         const more = new MDCRipple(document.querySelector('#more-' + i));
//         more.unbounded = true;
//         more.root_.onclick = () => {
//             menu.open = true;
//         };
//     }
// });

/* Get the value for the selected radio button */
// const getButtonValue = () => {
//     const radio1 = document.getElementById("radio-admin-new");
//     const radio2 = document.getElementById("radio-developer-new");
//     const radio3 = document.getElementById("radio-productowner-new");
//     const radio4 = document.getElementById("radio-releasemanager-new");

//     if (radio1.checked == true) {
//         return radio1.value;
//     }
//     else if (radio2.checked == true) {
//         return radio2.value;
//     }
//     else if (radio3.checked == true) {
//         return radio3.value;
//     }
//     else if (radio4.checked == true) {
//         return radio4.value;
//     }
// };

// const setUserRole = (user, role) => {
//     const xhttp = new XMLHttpRequest();
//     xhttp.open('PUT', 'users');
//     xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
//     const token = document.getElementsByName("csrf-token");
//     if (token.length > 0) {
//         xhttp.setRequestHeader('X-CSRF-Token', token[0].content);
//     }
//     xhttp.send('user[username]=' + user + '&user[role]=' + role);
//     console.log(user + "!" + role);
// };
