function validateForm(){
    console.log("click !");
    document.getElementById('form').submit()
}

function displayOrNot_add_remove_patient() {
    let consultation_type = document.getElementById("consultation_type");
    let consultation_type_selection = parseInt(consultation_type.options[consultation_type.selectedIndex].value);

    switch (consultation_type_selection) {
        case 0:
            document.getElementById("participants2").style.display = 'none';
            document.getElementById("participants3").style.display = 'none';
            break;
        case 1:
            document.getElementById("participants2").style.display = 'none';
            document.getElementById("participants3").style.display = 'none';
            break;
        case 2 :
            document.getElementById("participants2").style.display = 'block';
            document.getElementById("participants3").style.display = 'block';
            break;
        default:
            break;

    }

}

