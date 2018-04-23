
$(function() {
    $('#btnmakeWallet').click(function() {

        $.ajax({
            url: '/makeWallet',
            data: $('#walletForm').serialize(),
            type: 'POST',
            success: function(response) {
             location.href = "http://192.168.50.28:5000/showShop?id={{id}}"
            },
            error: function(error) {
             console.log(error);
            }
        });
    });
});