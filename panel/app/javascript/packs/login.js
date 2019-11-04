import {MDCRipple} from '@material/ripple';
import {MDCTextField} from '@material/textfield';

/*Radio Buttons*/
import {MDCFormField} from '@material/form-field';

import {MDCRadio} from '@material/radio';

const radio = new MDCRadio(document.querySelector('.mdc-radio'));
const formField = new MDCFormField(document.querySelector('.mdc-form-field'));
formField.input = radio;
/*End*/


document.addEventListener('turbolinks:load', () => {
    new MDCTextField(document.querySelector('#username-field'));
    const username = document.querySelector('#username');
    new MDCTextField(document.querySelector('#password-field'));
    const password = document.querySelector('#password');
    const login = new MDCRipple(document.querySelector('.mdc-button'));

    login.root_.onclick = () => {
        const xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = () => {
            console.log(xhttp);
            if (xhttp.status == 200) {
                window.location = 'list';
            }
        }

        if (username.value == "logout") {
            xhttp.open('DELETE', 'users/sign_out');
            xhttp.setRequestHeader('X-CSRF-Token', document.getElementsByName("csrf-token")[0].content);
            xhttp.send();
        } else {
            xhttp.open('POST', 'users/sign_in');
            xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
            const token = document.getElementsByName("csrf-token");
            if (token.length > 0) {
                xhttp.setRequestHeader('X-CSRF-Token', token[0].content);
            }
            xhttp.send("user[username]=" + username.value + "&user[password]=" + password.value);
        }
    }
});
