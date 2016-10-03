
$(document).ready(function() {
   
    var funDaskboard = {
        ajaxSumTreeMember : function(callback) {
            $.ajax({
                url : $('.downline-tree').data('link'),
                type : 'GET',
                data : {
                    'id' : $('.downline-tree').data('id')
                },
                async : true,
                success : function(result) {
                    result = $.parseJSON(result);
                    callback(result);
                }
            });
        },

        ajaxGetPin : function(callback) {
            $.ajax({
                url : $('.pin-balence').data('link'),
                type : 'GET',
                data : {
                    'id' : $('.pin-balence').data('id')
                },
                async : true,
                success : function(result) {
                    result = $.parseJSON(result);
                    callback(result);
                }
            });
        },

        ajaxAnalytics : function(element, callback) {
            $.ajax({
                url : element.data('link'),
                type : 'GET',
                data : {
                    'id' : element.data('id'),
                    'level' : element.data('level')
                },
                async : true,
                success : function(result) {
                    result = $.parseJSON(result);
                    callback(result);
                }
            });
        },
        ajaxGetTotalPD : function(callback) {
            $.ajax({
                url : $('.pd-count').data('link'),
                type : 'GET',
                data : {
                    'id' : $('.pd-count').data('id')
                },
                async : true,
                success : function(result) {
                    result = $.parseJSON(result);
                    callback(result);
                }
            });
        },
        ajaxGetTotalGD : function(callback) {
            $.ajax({
                url : $('.gd-count').data('link'),
                type : 'GET',
                data : {
                    'id' : $('.gd-count').data('id')
                },
                async : true,
                success : function(result) {
                    result = $.parseJSON(result);
                    callback(result);
                }
            });
        },

        ajaxGetR_Wallet : function(callback) {
            $.ajax({
                url : $('.r-wallet').data('link'),
                type : 'GET',
                data : {
                    'id' : $('.r-wallet').data('id')
                },
                async : true,
                success : function(result) {
                    result = $.parseJSON(result);
                    callback(result);
                }
            });
        },

        ajaxGetC_Wallet : function(callback) {
            $.ajax({
                url : $('.c-wallet').data('link'),
                type : 'GET',
                data : {
                    'id' : $('.c-wallet').data('id')
                },
                async : true,
                success : function(result) {
                    result = $.parseJSON(result);
                    callback(result);
                }
            });
        },
        ajaxGetM_Wallet : function(callback) {
            $.ajax({
                url : $('.m-wallet').data('link'),
                type : 'GET',
                data : {
                    'id' : $('.m-wallet').data('id')
                },
                async : true,
                success : function(result) {
                    result = $.parseJSON(result);
                    callback(result);
                }
            });
        },
        ajaxGetTotal_Binary_Left : function(callback) {
            $.ajax({
                url : $('.total_left').data('link'),
                type : 'GET',
                data : {
                    'id' : $('.total_left').data('id')
                },
                async : true,
                success : function(result) {
                    result = $.parseJSON(result);
                    callback(result);
                }
            });
        },
        ajaxGetTotal_PD_Left : function(callback) {
            $.ajax({
                url : $('.total_pd_left').data('link'),
                type : 'GET',
                data : {
                    'id' : $('.total_pd_left').data('id')
                },
                async : true,
                success : function(result) {
                    result = $.parseJSON(result);
                    callback(result);
                }
            });
        },
        ajaxGetTotal_Binary_Right : function(callback) {
            $.ajax({
                url : $('.total_right').data('link'),
                type : 'GET',
                data : {
                    'id' : $('.total_right').data('id')
                },
                async : true,
                success : function(result) {
                    result = $.parseJSON(result);
                    callback(result);
                }
            });
        },
        ajaxGetTotal_PD_Right : function(callback) {
            $.ajax({
                url : $('.total_pd_right').data('link'),
                type : 'GET',
                data : {
                    'id' : $('.total_pd_right').data('id')
                },
                async : true,
                success : function(result) {
                    result = $.parseJSON(result);
                    callback(result);
                }
            });
        },
        ajaxtotal_ch_wallet : function(callback) {
            $.ajax({
                url : $('.total_ch_wallet').data('link'),
                type : 'GET',
                data : {
                    'id' : $('.total_ch_wallet').data('id')
                },
                async : true,
                success : function(result) {
                    result = $.parseJSON(result);

                    callback(result);
                }
            });
        },
        ajaxhoahongconghuong : function(callback) {
            $.ajax({
                url : $('.hoahongconghuong').data('link'),
                type : 'GET',
                data : {
                    'id' : $('.hoahongconghuong').data('id')
                },
                async : true,
                success : function(result) {
                    result = $.parseJSON(result);

                    callback(result);
                }
            });
        },
    }

    

    funDaskboard.ajaxGetTotalPD(function(result) {
        _.has(result, 'success') && $('.pd-count').html(_.values(result)[0]);
        _.each($('.pd-count').data(), function(v, e) {
            $('.pd-count').removeAttr('data-' + e);
        });

        $('.tile-image-ph + div.tile-footer').css({
            'background-image' : 'none'
        });
    });

    funDaskboard.ajaxGetR_Wallet(function(result) {
        _.has(result, 'success') && $('.r-wallet').html(_.values(result)[0]  );
        _.each($('.r-wallet').data(), function(v, e) {
            $('.r-wallet').removeAttr('data-' + e);
        });

        $('div.tile-image-r-wallet + div.tile-footer').css({
            'background-image' : 'none'
        });
    });

    funDaskboard.ajaxGetC_Wallet(function(result) {
        _.has(result, 'success') && $('.c-wallet').html(_.values(result)[0]  );
        _.each($('.c-wallet').data(), function(v, e) {
            $('.r-wallet').removeAttr('data-' + e);
        });

        $('.tile-image-c-wallet + div.tile-footer').css({
            'background-image' : 'none'
        });
    });
    funDaskboard.ajaxGetM_Wallet(function(result) {
        _.has(result, 'success') && $('.m-wallet').html(_.values(result)[0]  );
        
        _.each($('.m-wallet').data(), function(v, e) {
            $('.m-wallet').removeAttr('data-' + e);
        });

        $('.tile-image-m-wallet + div.tile-footer').css({
            'background-image' : 'none'
        });
    });

   
    funDaskboard.ajaxGetTotal_Binary_Left(function(result) {
        _.has(result, 'success') && $('.total_left').html(_.values(result)[0]);
        _.each($('.total_left').data(), function(v, e) {
            $('.total_left').removeAttr('data-' + e);
        });

        
    });
    funDaskboard.ajaxGetTotal_PD_Left(function(result) {
        _.has(result, 'success') && $('.total_pd_left').html(_.values(result)[0]  );
        _.each($('.total_pd_left').data(), function(v, e) {
            $('.total_pd_left').removeAttr('data-' + e);
        });

        
    });
    funDaskboard.ajaxGetTotal_Binary_Right(function(result) {
        _.has(result, 'success') && $('.total_right').html(_.values(result)[0]);
        _.each($('.total_right').data(), function(v, e) {
            $('.total_right').removeAttr('data-' + e);
        });

       
    });
    funDaskboard.ajaxGetTotal_PD_Right(function(result) {
        _.has(result, 'success') && $('.total_pd_right').html(_.values(result)[0]  );
        _.each($('.total_pd_right').data(), function(v, e) {
            $('.total_pd_right').removeAttr('data-' + e);
        });

       
    });
    funDaskboard.ajaxtotal_ch_wallet(function(result) {
        _.has(result, 'success') && $('.total_ch_wallet').html(_.values(result)[0]  );
        _.each($('.total_ch_wallet').data(), function(v, e) {
            $('.total_ch_wallet').removeAttr('data-' + e);
        });
       $('.total_ch_wallet').html(result.amount);

       
    });
    funDaskboard.ajaxhoahongconghuong(function(result) {
        _.has(result, 'success') && $('.hoahongconghuong').html(_.values(result)[0]  );
        _.each($('.hoahongconghuong').data(), function(v, e) {
            $('.hoahongconghuong').removeAttr('data-' + e);
        });
       $('.hoahongconghuong').html(result.phantram);
    });

});

