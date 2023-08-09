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
		
		function statusChecker(){
			let user = document.getElementById('username');
			let password = document.getElementById('password');
			
			if(user.value == ""){
				document.getElementById('Status').innerHTML = "Invalid Username or Password";
				return false;
			}
			else if(password.value == ""){
				document.getElementById('Status').innerHTML = "Invalid Username or Password";
				return false;
			}
		}
		