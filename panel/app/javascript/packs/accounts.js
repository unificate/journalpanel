import {MDCFormField} from '@material/form-field';
import {MDCRadio} from '@material/radio';

document.addEventListener('turbolinks:load', () => {
    for (let i = 1; i <= 5; i++) {
        for (let j = 1; j <= 4; j++) {
            const radio = new MDCRadio(document.querySelector('#radio-' + i + j).parentElement);
            const formField = new MDCFormField(document.querySelector('#field-' + i + j));
            formField.input = radio;
        }
    }
});
