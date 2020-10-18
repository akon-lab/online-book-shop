function logRadio() {
    if (document.getElementById('auth').checked) {
        document.getElementById('auth-cont').style.display = 'block';
        document.getElementById('reg-cont').style.display = 'none';
    } else {
        document.getElementById('auth-cont').style.display = 'none';
        document.getElementById('reg-cont').style.display = 'block';
    }
}

function bill(bill) {
    if (bill == true) {
        document.getElementById('fade').style.display = 'block';
        bill == false;
    } else {
        document.getElementById('fade').style.display = 'none';
        bill = true;
    }
}

function openNav() {
    document.getElementById("Navka").style.width = '100%';
}

function closeNav() {
    document.getElementById("Navka").style.width = "0";
}