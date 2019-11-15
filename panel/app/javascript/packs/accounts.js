import {MDCFormField} from '@material/form-field';
import {MDCRadio} from '@material/radio';
import {MDCRipple} from '@material/ripple';
import {MDCTextField} from '@material/textfield';

document.addEventListener('turbolinks:load', () => {
    for (let radioElement of document.querySelectorAll('.mdc-radio')) {
        const radio = new MDCRadio(radioElement);
        const formField = new MDCFormField(radioElement.parentElement);
        formField.input = radio;
    }
    for (let textField of document.querySelectorAll('.mdc-text-field')) {
        new MDCTextField(textField);
    }
    const create = new MDCRipple(document.querySelector('.mdc-button'));
    create.root_.onclick = () => {
        const xhttp = new XMLHttpRequest();
        xhttp.onload = () => {
            console.log(xhttp.responseText);
            if (xhttp.status == 200) {
                location.reload()
            }
        }

        xhttp.open('POST', 'users');
        xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        const token = document.getElementsByName("csrf-token");
        if (token.length > 0) {
            xhttp.setRequestHeader('X-CSRF-Token', token[0].content);
        }
        xhttp.send('user[username]=' + username.value + '&user[password]=' + password.value);
    }
});
