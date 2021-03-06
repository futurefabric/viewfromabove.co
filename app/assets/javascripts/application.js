// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.fitvids.js
//= require_tree .



$(document).ready(function(){
  // Target your .container, .wrapper, .post, etc.
  $("#iss-video").fitVids();
});

// Open outbound links in new window
$("a").each(function(){
	if (this.href.indexOf(location.hostname) == -1) { $(this).attr('target', '_blank'); } 
});

// packery
var container = document.querySelector('.tweets');
var pckry;
// initialize Packery after all images have loaded
imagesLoaded( container, function() {
  pckry = new Packery( container );
});

// Google Analytics

(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

ga('create', 'UA-902179-20', 'viewfromabove.co');
ga('send', 'pageview');

