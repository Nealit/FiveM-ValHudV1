window.addEventListener('message', function(event) {
    if (event.data.type == "updateHPAR") {
        this.document.getElementById('js-healthbar').style.width = `${event.data.hp}%`;
        this.document.getElementById('js-armorbar').style.width = `${event.data.he}%`; 

    }
})

window.addEventListener('message', function(event) {
    if (event.data.type == 'updateInfo') {
        this.document.getElementById('js-charname').innerHTML = "<i class='bx bxs-user'></i> " + event.data.name;
        this.document.getElementById('js-id').innerHTML = "<i class='bx bxs-id-card' ></i> ID - " + event.data.id;
        this.document.getElementById('js-money').innerHTML = "<i class='bx bxs-wallet' ></i> Cash - " + event.data.cash;
        this.document.getElementById('js-job').innerHTML = "<i class='bx bx-street-view'></i> Job - " + event.data.pjob;
    }
})

window.addEventListener('message', function(event) {
    if (event.data.type === 'updateMetaUI') {
        this.document.getElementById('js-foodbar').style.width = `${event.data.phunger}%`;
        this.document.getElementById('js-energybar').style.widows = `${event.data.pthirsty}%`;
    }
})

window.addEventListener('message', function(event) {
    if (event.data.type === 'drivernow') {
        this.document.getElementById('js-healthbardiv').style.top = "71%"
        this.document.getElementById('js-cardiv').style.display = "block";
        this.document.getElementById('js-carfast').innerHTML = Math.floor(event.data.kmh);
        this.document.getElementById('js-carfuel').style.width = `${event.data.fuel}%`;
    } else if (event.data.type === 'seatnow') {
        this.document.getElementById('js-healthbardiv').style.top = "71%"
        this.document.getElementById('js-cardiv').style.display = "none";
    } else if (event.data.type === 'normalnow') {
        this.document.getElementById('js-healthbardiv').style.top = "90%"
        this.document.getElementById('js-cardiv').style.display = "none";
    }
})

window.addEventListener('message', function(event) {
    if (event.data.type === "canshowui") {
        this.document.body.style.display = "block";
    }
})

window.addEventListener('message', function(event) {
    if (event.data.type === "servernamegenreload") {
        this.document.getElementById('js-servername').innerHTML = event.data.sv_name;
        this.document.getElementById('js-servergenre').innerHTML = event.data.sv_genre
    }
})