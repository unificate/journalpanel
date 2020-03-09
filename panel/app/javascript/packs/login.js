// import {MDCRipple} from '@material/ripple';
// import {MDCTextField} from '@material/textfield';

document.addEventListener('turbolinks:load', () => {
    const loginButton = document.getElementById("login-button");
    const username = document.getElementById("username");
    const password = document.getElementById("password");

    // New user is submitted
    loginButton.onclick = () => {
        const xhttp = new XMLHttpRequest();
        xhttp.onload = () => {
            if (xhttp.status == 200) {
                window.location = 'list';
            } else {
                const error = document.querySelector('#login-error')
                error.innerText = xhttp.response;
                error.style.visibility = "visible";
            }
        }

        xhttp.open('POST', 'users/sign_in');
        xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        const token = document.getElementsByName("csrf-token");
        if (token.length > 0) {
            xhttp.setRequestHeader('X-CSRF-Token', token[0].content);
        }
        xhttp.send('user[username]=' + username.value + '&user[password]=' + password.value);
    }
});


// document.addEventListener('turbolinks:load', () => {
//     new MDCTextField(document.querySelector('#username-field'));
//     const username = document.querySelector('#username');
//     new MDCTextField(document.querySelector('#password-field'));
//     const password = document.querySelector('#password');
//     const login = new MDCRipple(document.querySelector('#login-button'));

//     login.root_.onclick = () => {
//         const xhttp = new XMLHttpRequest();
//         xhttp.onload = () => {
//             if (xhttp.status == 200) {
//                 window.location = 'list';
//             } else {
//                 const error = document.querySelector('#login-error')
//                 error.innerText = xhttp.response;
//                 error.style.display = "block";
//             }
//         }

//         xhttp.open('POST', 'users/sign_in');
//         xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
//         const token = document.getElementsByName("csrf-token");
//         if (token.length > 0) {
//             xhttp.setRequestHeader('X-CSRF-Token', token[0].content);
//         }
//         xhttp.send('user[username]=' + username.value + '&user[password]=' + password.value);
//     }
// });
