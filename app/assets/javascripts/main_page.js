$(document).ready(function(){

            $('#js-container').jsquares();
            $('#js-container-2').jsquares({
                js_shuffle_in: false, // have the pictures all fade in on page load?
                js_fade_on_hover: false, // do we want the images to fade on hover or just change opacity?
                js_caption_slide_down: false // do we want the caption to slide down or just appear?
            });
            
        });