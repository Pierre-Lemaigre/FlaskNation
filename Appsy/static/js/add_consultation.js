//Validate a form named 'form' with js
function validateForm(){
    document.getElementById('form').submit()
}

//Unlock the right number of participants slot associate withe the type of consultation
function displayOrNot_add_remove_patient() {
    let consultation_type = document.getElementById("consultation_type");
    let consultation_type_selection = parseInt(consultation_type.options[consultation_type.selectedIndex].value);

    switch (consultation_type_selection) {

        //Consultation solo
        case 0:
            document.getElementById("participants2").style.display = 'none';
            document.getElementById("participants3").style.display = 'none';
            break;

        //Consultation couple
        case 1:
            document.getElementById("participants2").style.display = 'none';
            document.getElementById("participants3").style.display = 'none';
            break;

        //Consultation group
        case 2 :
            document.getElementById("participants2").style.display = 'block';
            document.getElementById("participants3").style.display = 'block';
            break;

        default:
            break;

    }

}

