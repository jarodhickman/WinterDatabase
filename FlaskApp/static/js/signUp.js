$(function() {
    $('#btnSignUp').click(function() {
 
        $.ajax({
            url: '/signUp',
            data: $('form').serialize(),
            type: 'POST',
            success: function(response) {
             location.href = "http://192.168.50.28/web/BitBizzar/signin.html"
            },
            error: function(error) {
             console.log(error);  
            }
        });
    });
});