let idLastProfession = 1;

//Display a popup that permit to add a new profession to all dropdown lists
function addNewProfession(id) {
    let profession = prompt('Nouvelle proffession');

    if (profession != null) {

        //Add the new profession to all dropdown lists
        for (let i = 1; i < 6; i++) {
            let option = document.createElement('option');
            option.text = profession;
            option.value = id;
            document.getElementById('profession' + i).add(option);
        }

    }
}

//Display a slot for a profession
function addProfessionToHistory() {

    if (idLastProfession < 5) {
        idLastProfession++;
        document.getElementById("profession" + idLastProfession).style.display = 'block';
    }

}

//Hide a slot for a profession
function removeProfessionToHistory() {

    if (idLastProfession > 1) {
        document.getElementById("profession" + idLastProfession).style.display = 'none';
        idLastProfession--;
    }

}
