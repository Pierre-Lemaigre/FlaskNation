let idLastProfession = 1;

function addNewProfession(id) {
    let profession = prompt('Nouvelle proffession');

    if (profession != null) {

        for (let i = 1; i < 6; i++) {
            let option = document.createElement('option');
            option.text = profession;
            option.value = id;
            document.getElementById('profession' + i).add(option);
        }

    }
}

function addProfessionToHistory() {

    if (idLastProfession < 5) {
        idLastProfession++;
        document.getElementById("profession" + idLastProfession).style.display = 'block';
    }

}

function removeProfessionToHistory() {

    if (idLastProfession > 1) {
        document.getElementById("profession" + idLastProfession).style.display = 'none';
        idLastProfession--;
    }

}
