 /*$(function() {
 	$( "#loginDialog" ).dialog({
        autoOpen: false,  
    });
});

$(document).ready(function(){
	$('#loginButton').click( function() {
		$( "#loginDialog" ).dialog( "open" );
    });
});
*/
window.onload = function() {
    var modal = new RModal(document.getElementById('modal'), {
        //content: 'Abracadabra'
        beforeOpen: function(next) {
            console.log('beforeOpen');
            next();
        }
        , afterOpen: function() {
            console.log('opened');
        }

        , beforeClose: function(next) {
            console.log('beforeClose');
            next();
        }
        , afterClose: function() {
            console.log('closed');
        }
        // , bodyClass: 'modal-open'
        // , dialogClass: 'modal-dialog modal-dialog-lg'
        // , dialogOpenClass: 'animated fadeIn'
        // , dialogCloseClass: 'animated fadeOut'

        // , focus: true
        // , focusElements: ['input.form-control', 'textarea', 'button.btn-primary']

        // , escapeClose: true
    });

    document.addEventListener('keydown', function(ev) {
        modal.keydown(ev);
    }, false);

    document.getElementById('showModal').addEventListener("click", function(ev) {
        ev.preventDefault();
        modal.open();
    }, false);

    window.modal = modal;
}