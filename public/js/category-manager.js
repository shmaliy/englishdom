$(document).ready(function(){
    $.fn.active();
});

function strstr (haystack, needle, bool) {
    var pos = 0;

    haystack += '';
    pos = haystack.indexOf(needle);
    if (pos == -1) {
        return false;
    } else {
        if (bool) {
            return haystack.substr(0, pos);
        } else {
            return haystack.slice(pos);
        }
    }
}

(function( $ ) {
    var url;
    var menu;
    var record;
    
    var methods = {
        init: function () {
            url = window.location.pathname;    
            menu = $('.navigation');
            $(this).active('initMenu');
            record = $('#RecordContainer'); 
            $(record).hide();
        },
                
        initMenu: function() {
            $(menu).find('a').each(function(){
                $(this).removeClass('active').parents('ul').removeClass('sub-active');
                $(this).removeClass('sub-active-link');
            });
            
            $(menu).find('a').each(function(){
                if ($(this).attr('href') == url) {
                    $(this).addClass('active').parents('ul').addClass('sub-active');
                    $(this).next('ul').addClass('sub-active').show();
                } else {
                    if (strstr(url, $(this).attr('href'))) {
                        $(this).addClass('sub-active-link');
                    }
                }
            });
            
            $(menu).find('ul').each(function(){
                if (!$(this).hasClass('sub-active')) {
                    $(this).hide();
                }
            });
            $(this).active('observeMenu');
        },
                
        observeMenu: function() {
            $(menu).find('a').each(function(){
                $(this).unbind('click');
                $(this).click(function(e) {
                    e.preventDefault();
                    url = $(this).attr('href');
                    $(this).active('initMenu');
                    $(this).active('request', $(this).attr('href'));
                });
            });
        },        
        
                
        renderLoader: function(target, method)
        {
            var trg = $('#' + target);
            var loader = '<img src="/img/ajax-loader.gif" class="ajax-loader-circle" />';
            
            if (method == 'prepend') {
                $(trg).prepend(loader);
            }
            
            if (method == 'append') {
                $(trg).append(loader);
            }
            
            if (method == 'replace') {
                $(trg).html(loader);
            }
            
        },
                
        request: function (url)
        {
            $(record).html('').show();
            $(this).active('renderLoader', 'RecordContainer', 'replace');
            $.ajax({
                url: url,
                data: {path: url},
                type: 'POST',
                error: function(jqXHR, textStatus, errorThrown) {},
                success: function(data, textStatus, jqXHR) {
                    var result = $.parseJSON(jqXHR.responseText);
                    $(record).html('');
                    $(record).append('<h2>' + result['title'] + '</h2>');
                    $(record).append('<div>' + result['content'] + '</div>');
                },
                complete: function(jqXHR, textStatus) {}
            });  
        }
    };
	
    $.fn.active = function( method ) {

        if ( methods[method] ) {
            return methods[method].apply( this, Array.prototype.slice.call( arguments, 1 ));
        } else if ( typeof method === 'object' || ! method ) {
            return methods.init.apply( this, arguments );
        } else {
            $.error( 'Method ' +  method + ' does not exist on jQuery.tooltip' );
        }    

    };
})( jQuery );