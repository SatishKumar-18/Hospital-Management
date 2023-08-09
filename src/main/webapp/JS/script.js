const navMenu = document.getElementById('nav-menu');
const navToggle = document.getElementById('nav-toggle');
const navClose = document.getElementById('nav-close');

if(navToggle){
    navToggle.addEventListener('click', () =>{
        navMenu.classList.add('show-menu')
    })
}

if(navClose){
    navClose.addEventListener('click', () =>{
        navMenu.classList.remove('show-menu')
    })
}

/* -------Remove menu Mobile--------- */
const navLink = document.querySelectorAll('.nav_link');

const linkAction = () =>{
    navMenu = document.getElementById('nav-menu');
    navMenu.classList.remove('show-menu');
}
navLink.forEach(n => n.addEventListener('click', linkAction))

const scrollHeader = () =>{
    const header = document.getElementById('header');
    this.scrollY >= 50 ? header.classList.add('bg-header'):header.classList.remove('bg-header');
}
window.addEventListener('scroll', scrollHeader);

/* ---------------- Page Scroll ---------------- */
const sections = document.querySelectorAll('section[id]');

const scrollActive = () =>{
    const scrollY = window.pageYOffset;

    sections.forEach(current =>{
        const sectionHeight = current.offsetHeight;
        const sectionTop = current.offsetTop - 58;
        const sectionId = current.getAttribute('id');
        const sectionClass = document.querySelector('.nav_menu a[href*=' +sectionId+']');

        if(scrollY > sectionTop && scrollY <= sectionTop + sectionHeight){
            sectionClass.classList.add('active-link');
        }
        else{
            sectionClass.classList.remove('active-link');
        }
    })
}
window.addEventListener('scroll', scrollActive);

/* -------------- Scroll Up ------------ */
const scrollUp = () =>{
    const scrollUp = document.getElementById('scroll-up');

    this.scrollY >= 350 ? scrollUp.classList.add('show-scroll')
    :scrollUp.classList.remove('show-scroll');
}
window.addEventListener('scroll', scrollUp);

/* ----------------Scroll REveal------------------- */
const sr = ScrollReveal({
    origin: 'top',
    distance: '60px',
    duration: 2500,
    delay: 400,
})
sr.reveal('.home_data, .footer_container, .footer_group, .service')
sr.reveal('.home_img', {delay: 700, origin: 'bottom'})
sr.reveal('.logos_img, .program_card, .doctor_card', {interval: 100})
sr.reveal('.about_img', {origin: 'left'})
sr.reveal('.about_content', {origin: 'right'})