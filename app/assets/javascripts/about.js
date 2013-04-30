//= require raphael-min

// (function() {
//     var canvas = document.getElementById('#canvas'),
//     context = canvas.getContext('2d');

//     // resize the canvas to fill browser window dynamically
//     window.addEventListener('resize', resizeCanvas, false);

//     function resizeCanvas() {
//             canvas.width = window.innerWidth - 16;
//             canvas.height = window.innerHeight;

//             /**
//              * Your drawings need to be inside this function otherwise they will be reset when 
//              * you resize the browser window and the canvas goes will be cleared.
//              */
//             drawStuff(); 
//     }
//     resizeCanvas();

//     function drawStuff() {
//        // Raphael
       	
//     }
// })();

// Setup the paper
var svgEl = document.getElementById('canvas');
var canvas = Raphael( svgEl, window.innerWidth - 16, window.innerHeight);

// // Creates circle at x = 50, y = 40, with radius 10
// var circle = paper.circle(-50, 800, 2);
// // Sets the fill attribute of the circle to red (#f00)
// circle.attr("fill", "#ffffff");
// circle.animate({cx:2500, cy:200}, 90000);


//var canvas = Raphael( 0, 0, 600, 600 );
var pathstr = "M0,0L2500,200";

var circle = canvas.circle( 0, 0, 2 ).attr( { fill: 'white' } );
var path = arrowline( canvas, pathstr, 4000, { stroke: '#31283E', 'stroke-width': 1, 'fill-opacity': 0 }, null, circle );

function arrowline( canvas, pathstr, duration, attr, callback, cursor )
{    
    var guide_path = canvas.path( pathstr ).attr( { stroke: "none", fill: "none" } );
    var path = canvas.path( guide_path.getSubpath( 0, 1 ) ).attr( attr );
    var total_length = guide_path.getTotalLength( guide_path );
    var start_time = new Date().getTime();
    var interval_length = 25;
    
    var interval_id = setInterval( function()
        {
            var elapsed_time = new Date().getTime() - start_time;
            var this_length = elapsed_time / duration * total_length;
            var subpathstr = guide_path.getSubpath( 0, this_length );
            attr.path = subpathstr;
            path.animate( attr, interval_length );
                                       
            if ( elapsed_time >= duration )
            {
                clearInterval( interval_id );
                if ( callback != undefined ) callback();
            }   
            if ( cursor != undefined )
            {
                var point = guide_path.getPointAtLength( this_length );
                cursor.animate( { transform: "T" + point.x + "," + point.y }, interval_length );
            }                
        }, interval_length );  
    return path;    
}