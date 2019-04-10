var imageCount = 1;
var total = 15;

function photo(x) {
	var image = document.getElementById('image');
	imageCount = imageCount + x;
	if(imageCount > total){imageCount = 1;}
	if(imageCount < 1){imageCount = total;}	
	image.src = "Images/1"+ imageCount +".jpg";
	clearInterval(time); 								// clear interval stops the set interval.

	
	time =  window.setInterval(function photoA() { 		// giving the value of time the some function below starts the loop 
	var image = document.getElementById('image');
	imageCount = imageCount + 1;
	if(imageCount > total){imageCount = 1;}
	if(imageCount < 1){imageCount = total;}	
	image.src = "Images/portfolio/img"+ imageCount +".jpg";
	},9000);
	}
 
var time = window.setInterval(function photoA() {    // just assign the function to the variable so you can target it.
	var image = document.getElementById('image');
	imageCount = imageCount + 1;
	if(imageCount > total){imageCount = 1;}
	if(imageCount < 1){imageCount = total;}	
	image.src = "Images/portfolio/img"+ imageCount +".jpg";
	},9000);

