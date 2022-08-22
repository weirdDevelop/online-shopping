$(function () {

    // for handling CSRF token

    // for handling CSRF token
    var token = $('meta[name="_csrf"]').attr('content');
    var header = $('meta[name="_csrf_header"]').attr('content');

    var viewOrderItemsUrl = '';

    if ((token != undefined && header != undefined) && (token.length > 0 && header.length > 0)) {
        // set the token header for the ajax request
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(header, token);
        });
    }

    var persian = {
        "sEmptyTable": "هیچ داده‌ای در جدول وجود ندارد",
        "sInfo": "نمایش _START_ تا _END_ از _TOTAL_ ردیف",
        "sInfoEmpty": "نمایش 0 تا 0 از 0 ردیف",
        "sInfoFiltered": "(فیلتر شده از _MAX_ ردیف)",
        "sInfoPostFix": "",
        "sInfoThousands": ",",
        "sLengthMenu": "نمایش _MENU_ ردیف",
        "sLoadingRecords": "در حال بارگزاری...",
        "sProcessing": "در حال پردازش...",
        "sSearch": "جستجو:",
        "sZeroRecords": "رکوردی با این مشخصات پیدا نشد",
        "oPaginate": {
            "sFirst": "برگه‌ی نخست",
            "sLast": "برگه‌ی آخر",
            "sNext": "بعدی",
            "sPrevious": "قبلی"
        },
        "oAria": {
            "sSortAscending": ": فعال سازی نمایش به صورت صعودی",
            "sSortDescending": ": فعال سازی نمایش به صورت نزولی"
        }
    };



    // code for jquery dataTable
    var $table = $('#productListTable');

    // execute the below code only where we have this table
    if ($table.length) {
        // console.log('Inside the table!');

        var jsonUrl = '';
        if (!(window.categoryId || window.subCategoryId || window.brandId)) {
            jsonUrl = window.contextRoot + '/json/data/all/products';

            console.log("all product");
            console.log(window.categoryId);
            console.log(window.subCategoryId);
            console.log(window.brandId);
        } else if (window.categoryId || !window.subCategoryId && !window.brandId ) {
            jsonUrl = window.contextRoot + '/json/data/category/'
                + window.categoryId + '/products';
            console.log("all cat");
            console.log( window.categoryId);
            console.log(window.subCategoryId);
            console.log(window.brandId);
        }
        else if (window.subCategoryId && !window.brandId) {
            jsonUrl = window.contextRoot + '/json/data/subCategory/'
                + window.subCategoryId + '/products';
            console.log("all sub cat");
            console.log( window.categoryId);
            console.log(window.subCategoryId);
            console.log(window.brandId);
        }else
        {
            jsonUrl = window.contextRoot + '/json/data//brand/'
                + window.brandId+ '/products';
            console.log("by brand");
            console.log( window.categoryId);
            console.log(window.subCategoryId);
        }

        $table.DataTable({
            destroy: true,
            language: persian,
            lengthMenu: [[3, 5, 10, -1],
                ['3 Records', '5 Records', '10 Records', 'ALL']],
            pageLength: 5,
            ajax: {
                url: jsonUrl,
                dataSrc: ''
            },
            columns: [
                {
                    data: 'code',
                    bSortable: false,
                    mRender: function (data, type, row) {

                        return '<img src="' + window.contextRoot
                            + '/resources/images/' + data
                            + '.jpg" class="dataTableImg"/>';

                    }
                },
                {
                    data: 'name'
                },
                {
                    data: 'brand'
                },
                {
                    data: 'unitPrice',
                    mRender: function (data, type, row) {
                        if (row.discount > 0) {
                            var str = '<span class="price"> ' + (data - (data * row.discount / 100)) + ' تومان </span></br><del>' + data + '</del></br><div class="on_sale"></div>' +
                                '<span> تخفیف ' + row.discount + '%</span>';
                            return str;
                        }
                        return '<span class="price">' + data + '</span>';
                    }
                },
                {
                    data: 'quantity',
                    mRender: function (data, type, row) {

                        if (data < 1) {
                            return '<span style="color:red">نا موجود!</span>';
                        }

                        return data;

                    }
                },
                {
                    data: 'id',
                    bSortable: false,
                    mRender: function (data, type, row) {

                        var str = '';
                        str += '<a href="'
                            + window.contextRoot
                            + '/show/'
                            + data
                            + '/product" class="btn btn-fill-out"><span class="ti ti-eye"></span></a> &#160;';


                        if (userRole !== 'ADMIN') {
                            if (row.quantity < 1) {
                                str += '<a href="javascript:void(0)" class="btn btn-dark disabled"><span class="ti ti-shopping-cart"></span></a>';
                            } else {

                                str += '<a href="'
                                    + window.contextRoot
                                    + '/cart/add/'
                                    + data
                                    + '/product" class="btn btn-fill-out"><span class="ti ti-shopping-cart"></span></a>';
                            }
                        }
                        else {
                            str += '<a href="'
                                + window.contextRoot
                                + '/manage/'
                                + data
                                + '/product" class="btn btn-warning"><span class="ti ti-pencil"></span></a>';
                        }

                        return str;

                    }

                }]
        });
    }

    $('#unConfirmedRates-tab').click(function () {

        console.log("here");
        var $unConfirmedRates = $('#unConfirmedRatesListTable');

        if ($unConfirmedRates.length) {

            var json = window.contextRoot + '/json/data/admin/allRates';
            console.log(json);

            $unConfirmedRates.DataTable({
                destroy: true,
                language: persian,
                lengthMenu: [[10, 30, 50, -1], ['10 Records', '30 Records', '50 Records', 'ALL']],
                pageLength: 30,
                ajax: {
                    url: json,
                    dataSrc: ''
                },
                columns: [
                    {
                        data: 'id'

                    },
                    {
                        data: 'userEmail'
                    },
                    {
                        data: 'description',
                        mRender: function (data, type, row) {
                            return '<pre>' + data + ' </pre>';
                        }
                    },
                    {
                        data: 'rateNumber'

                    },
                    {
                        data: 'userName'

                    },
                    {
                        data: 'productId'
                        , mRender: function (data, type, row) {

                        return '<a href="' + window.contextRoot + '/show/' + data + '/product" class="btn btn-fill-out"><span class="ti ti-eye"></span></a>';

                    }

                    },
                    {
                        data: 'active'
                        , bSortable: false,
                        mRender: function (data, type, row) {
                            var str = '';
                            if (data) {
                                str += '<label class="switch"> <input type="checkbox" value="' + row.id + '" checked="checked">  <div class="sliderBox round"> </div></label>';

                            } else {
                                str += '<label class="switch"> <input type="checkbox" value="' + row.id + '">  <div class="sliderBox round"> </div></label>';
                            }

                            return str;
                        }

                    },
                    {
                        data: 'suggestion'
                        , mRender: function (data, type, row) {
                        var string = '';
                        if (data == 0) {
                            string = 'نظری ندارم';
                        } else if (data == -1) {
                            string = 'پیشنهاد نمی کنم';
                        } else {
                            string = 'پیشنهاد می کنم';
                        }
                        return string;
                    }

                    }
                    ,
                    {
                        data: 'timeSent'

                    }
                ],
                initComplete: function () {
                    var api = this.api();
                    api.$('.switch input[type="checkbox"]').on('change', function () {
                        var dText = (this.checked) ? 'You want to activate the Rate?' : 'You want to de-activate the Rate?';
                        var checked = this.checked;
                        var checkbox = $(this);

                        bootbox.confirm({
                            size: 'medium',
                            title: 'Rate Activation/Deactivation',
                            message: dText,
                            callback: function (confirmed) {
                                if (confirmed) {
                                    $.ajax({
                                        type: 'GET',
                                        url: window.contextRoot + '/manage/rate/' + checkbox.prop('value') + '/activation',
                                        timeout: 100000,
                                        success: function (data) {
                                            bootbox.alert(data);
                                        },
                                        error: function (e) {
                                            bootbox.alert('ERROR: ' + e);
                                            //display(e);
                                        }
                                    });
                                }
                                else {
                                    checkbox.prop('checked', !checked);

                                }
                            }
                        });
                    });

                }
            });
        }
    });



    // list of all products for admin
    var $productsTable = $('#productsTable');

    var categoryTemp = [];
    var subCategoryTemp =[];
    if ($productsTable.length) {

        var jsonUrl = window.contextRoot + '/json/data/admin/all/products';

        $.ajax({
            url: window.contextRoot + '/json/data/admin/all/categories',

            type: 'get',
            success: function (data) {
                $.each(data, function(i, v){categoryTemp.push(v);})

            },
            error: function () {
                alert("error");
            }
        });

        $.ajax({
            url: window.contextRoot + '/json/data/admin/all/subCategories',

            type: 'get',
            success: function (data) {
                $.each(data, function(i, v){subCategoryTemp.push(v);})

            },
            error: function () {
                alert("error");
            }

        });

        console.log(jsonUrl);
        $productsTable.DataTable({

            responsive: true,
            destroy: true,
            language: persian,
            lengthMenu: [[10, 30, 50, -1], ['10 Records', '30 Records', '50 Records', 'ALL']],
            pageLength: 30,
            ajax: {
                url: jsonUrl,
                dataSrc: ''
            },
            columns: [
                {data: 'id'},

                {
                    data: 'code',
                    bSortable: false,
                    mRender: function (data, type, row) {
                        return '<img src="' + window.contextRoot
                            + '/resources/images/' + data
                            + '.jpg" class="dataTableImg"/>';
                    }
                },
                {
                    data: 'name'
                },
                {
                    data: 'brand'
                },
                {
                    data: 'quantity',
                    mRender: function (data, type, row) {

                        if (data < 1) {
                            return '<span style="color:red">نا موجود!</span>';
                        }

                        return data;

                    }
                },
                {
                    data: 'unitPrice',
                    mRender: function (data, type, row) {
                        if (row.discount > 0) {
                            var str = '<span class="price"> ' + (data - (data * row.discount / 100)) + ' تومان </span></br><del>' + data + '</del></br><div class="on_sale"></div>' +
                                '<span> تخفیف ' + row.discount + '%</span>';
                            return str;
                        }
                        return '<span class="price">' + data + '</span>';
                    }
                }
                ,
                {
                    data: 'active',
                    bSortable: false,
                    mRender: function (data, type, row) {
                        var str = '';
                        if (data) {
                            str += '<label class="switch"> <input type="checkbox" checked="checked" value="' + row.id + '">  <div class="sliderBox round"> </div></label>';

                        } else {
                            str += '<label class="switch"> <input type="checkbox" value="' + row.id + '">  <div class="sliderBox round"> </div></label>';
                        }

                        return str;
                    }
                },
                {
                    data: 'lastUpdate'

                },

                {
                    data: 'id',
                    mRender: function (data, type, row) {


                        return '<button type="button" class="btn btn-fill-out" id="viewDetails" data-toggle="modal"  data-target="#productDetailsModalForAdmin">' +
                            '<span class="ti ti-eye"></span></button>';

                    }


                },
                {
                    data: 'id',
                    bSortable: false,
                    mRender: function (data, type, row) {

                        var str = '';
                        str += '<a href="'
                            + window.contextRoot
                            + '/manage/'
                            + data
                            + '/product" class="btn btn-fill-out"><span class="ti ti-pencil"></span></a> &#160;';

                        return str;
                    }
                }
            ],


            initComplete: function () {
                var api = this.api();
                api.$('.switch input[type="checkbox"]').on('change', function () {
                    var dText = (this.checked) ? 'You want to activate the Product?' : 'You want to de-activate the Product?';
                    var checked = this.checked;
                    var checkbox = $(this);

                    bootbox.confirm({
                        size: 'medium',
                        title: 'Product Activation/Deactivation',
                        message: dText,
                        callback: function (confirmed) {
                            if (confirmed) {
                                $.ajax({
                                    type: 'GET',
                                    url: window.contextRoot + '/manage/product/' + checkbox.prop('value') + '/activation',
                                    timeout: 100000,
                                    success: function (data) {
                                        bootbox.alert(data);
                                    },
                                    error: function (e) {
                                        bootbox.alert('ERROR: ' + e);
                                        //display(e);
                                    }
                                });
                            }
                            else {
                                checkbox.prop('checked', !checked);
                            }
                        }
                    });
                });

                $("#productsTable,button").on("click", "#viewDetails", function (evt) {


                    var t1 = $("#productsTable").DataTable();
                    var tr = $(this).closest("tr");
                    var row = t1.row(tr);
                    var data = JSON.parse(JSON.stringify(row.data()));

                    console.log(data);

                    var $productDetailsModalForAdmin = $('#productDetailsModalForAdmin');
                    if ($productDetailsModalForAdmin.length) {
                        console.log("here");
                        var productDetailsForAdmin = $('#productDetailsForAdmin'), userAddress = "";
                        productDetailsForAdmin.empty();
                        userAddress = '<address> id :' + data.id +  '<br> توضیخات :' + data.description + '<br> توضضیحات کوتاه : ' + data.preDescription + '<br>' +
                            ' وزن : ' + data.weight + 'kg <br> توان : '+data.watt+'W <br> گارانتی :'+data.warranty +'<br> برند : '+ data.brand+'<br> کشور سازنده :' + data.country + '</address>';
                        productDetailsForAdmin.append(userAddress);
                    }

                    console.log(data.preDescription);
                    var $productDetailsTable = $('#productDetailsTable');

                    if ($productDetailsTable.length) {



                        console.log('Inside the table!');

                        $productDetailsTable.DataTable({
                            destroy: true,
                            language: persian,
                            columns: [
                                {
                                    data: 'id'
                                },
                                {
                                    data: 'description'

                                },
                                {
                                    data: 'preDescription'

                                },
                                {
                                    data: 'weight',
                                    mRender: function (data, type, row) {
                                        return data + 'kg';
                                    }
                                },
                                {
                                    data: 'watt',
                                    mRender: function (data, type, row) {
                                        return data + 'watt';
                                    }
                                },
                                {
                                    data: 'warranty'

                                },
                                {
                                    data: 'brand'

                                },
                                {
                                    data: 'country'

                                }

                            ]
                        });
                    }


                });

            }
        });
    }


    // jQuery Validation Code

    //methods required for validation

    function errorPlacement(error, element) {
        // Add the 'help-block' class to the error element
        error.addClass("help-block");


        // add the error label after the input element
        error.insertAfter(element);


        // add the has-feedback class to the
        // parent div.validate in order to add icons to inputs
        element.parents(".validate").addClass("has-feedback");

    }


    // validating the product form element
    // fetch the form element
    $categoryForm = $('#categoryForm');

    if ($categoryForm.length) {

        $categoryForm.validate({
                rules: {
                    name: {
                        required: true,
                        minlength: 3
                    },
                    description: {
                        required: true,
                        minlength: 3
                    }
                },
                messages: {
                    name: {
                        required: 'Please enter product name!',
                        minlength: 'Please enter atleast five characters'
                    },
                    description: {
                        required: 'Please enter product name!',
                        minlength: 'Please enter atleast five characters'
                    }
                },
                errorElement: "em",
                errorPlacement: function (error, element) {
                    errorPlacement(error, element);
                }
            }
        );

    }

    /*validating the loginform*/

    // validating the product form element
    // fetch the form element
    $loginForm = $('#loginForm');

    if ($loginForm.length) {

        $loginForm.validate({
                rules: {
                    username: {
                        required: true,
                        email: true

                    },
                    password: {
                        required: true
                    }
                },
                messages: {
                    username: {
                        required: 'Please enter your email!',
                        email: 'Please enter a valid email address!'
                    },
                    password: {
                        required: 'Please enter your password!'
                    }
                },
                errorElement: "em",
                errorPlacement: function (error, element) {
                    // Add the 'help-block' class to the error element
                    error.addClass("help-block");

                    // add the error label after the input element
                    error.insertAfter(element);
                }
            }
        );

    }


    /*------*/
    /* for fading out the alert message after 3 seconds */
    $alert = $('.alert');
    if ($alert.length) {
        setTimeout(function () {
                $alert.fadeOut('slow');
            }, 3000
        );
    }

    /*------*/


    $('#selectCategory').change(function () {

        var categoryId = $(this).val();
        console.log(categoryId);

        $.ajax({

            url: window.contextRoot + "/json/data/admin/category/" + categoryId + "/subCategory",
            type: 'POST',
            success: function (data) {

                var slctSubcat = $('#subCategory'), option = "";
                slctSubcat.empty();

                var selectType = $('#speciesSelect');
                selectType.empty();


                console.log(data.length);
                for (var i = 0; i < data.length; i++) {
                    option = option + '<option value="' + data[i].id + '">' + data[i].name + '</option>';

                }
                slctSubcat.append(option);
            },
            error: function () {
                alert("error");
            }
        })
    });

    $('#subCategory').change(function () {

        var subCategoryId = $(this).val();
        console.log(subCategoryId);

        $.ajax({

            url: window.contextRoot + "/json/data/admin/subCategory/" + subCategoryId + "/species",
            type: 'POST',
            success: function (data) {

                var selectType = $('#speciesSelect'), option = "";
                selectType.empty();

                console.log(data.length);
                for (var i = 0; i < data.length; i++) {
                    option = option + '<option value="' + data[i].name + '">' + data[i].name + '</option>';

                }
                selectType.append(option);
            },
            error: function () {
                alert("error");
            }
        })
    });

    $rating = $('#rating');
    if ($rating.length) {
        $rating.rateYo()
            .on("rateyo.change", function (e, data) {

                var rating = data.rating;
                $(this).next().text(rating);
                $('#hdrating').val(rating)
            });
    }

    $showrate = $('#showrate');
    if ($showrate.length) {
        $showrate.rateYo({
            rating: window.productScore,
            readOnly: true
        });
    }

    $('#unConfirmedOrders-tab').click(function () {

        console.log("here");
        var $unConfirmedOrders = $('#unConfirmedOrdersListTable');

        if ($unConfirmedOrders.length) {

            var json = window.contextRoot + '/json/data/admin/orders/0/details';
            console.log(json);

            $unConfirmedOrders.DataTable({
                destroy: true,
                language: persian,
                lengthMenu: [[10, 30, 50, -1], ['10 Records', '30 Records', '50 Records', 'ALL']],
                pageLength: 30,
                ajax: {
                    url: json,
                    dataSrc: ''
                },
                columns: [
                    {
                        data: 'id'

                    },
                    {
                        data: 'user.id'
                    },
                    {
                        data: 'orderTotal',
                        mRender: function (data, type, row) {
                            return data + 'تومان';
                        }
                    },
                    {
                        data: 'shipping',
                        mRender: function (data, type, row) {
                            return '<button type="button" class="btn btn-fill-out" id="adminViewOrderAddress" data-toggle="modal"  data-target="#userOrderAddressModalForAdmin">' +
                                '<span class="ti ti-map"></span></button>';
                        }


                    },
                    {
                        data: 'orderCount'

                    },
                    {
                        data: 'orderDate'

                    },
                    {
                        data: 'status'
                        , bSortable: false,
                        mRender: function (data, type, row) {
                            var str = '';
                            if (data) {
                                str += '<label class="switch"> <input type="checkbox" value="' + row.id + '" checked="checked">  <div class="sliderBox round"> </div></label>';

                            } else {
                                str += '<label class="switch"> <input type="checkbox" value="' + row.id + '">  <div class="sliderBox round"> </div></label>';
                            }

                            return str;
                        }

                    }
                    ,
                    {
                        data: 'orderItems',
                        mRender: function (data, type, row) {


                            return '<button type="button" class="btn btn-fill-out" id="viewProducts" data-toggle="modal"  data-target="#orderItemsListModal">' +
                                '<span class="ti ti-eye"></span></button>';

                        }


                    }

                ],
                initComplete: function () {
                    var api = this.api();
                    api.$('.switch input[type="checkbox"]').on('change', function () {
                        var dText = (this.checked) ? 'You want to activate the order?' : 'You want to de-activate the order?';
                        var checked = this.checked;
                        var checkbox = $(this);

                        bootbox.confirm({
                            size: 'medium',
                            title: 'Rate Activation/Deactivation',
                            message: dText,
                            callback: function (confirmed) {
                                if (confirmed) {
                                    $.ajax({
                                        type: 'GET',
                                        url: window.contextRoot + '/manage/orderDetail/' + checkbox.prop('value') + '/activation',
                                        timeout: 100000,
                                        success: function (data) {
                                            bootbox.alert(data);

                                        },
                                        error: function (e) {
                                            bootbox.alert('ERROR: ' + e);
                                            //display(e);
                                        }
                                    });
                                }
                                else {
                                    checkbox.prop('checked', !checked);

                                }
                            }
                        });
                    });

                    $("#unConfirmedOrdersListTable button").on("click","#viewProducts",function (evt) {


                        var t1 = $("#unConfirmedOrdersListTable").DataTable();
                        var tr = $(this).closest("tr");
                        var row = t1.row(tr);
                        var data = JSON.parse(JSON.stringify(row.data()));
                        console.log(data.orderItems);
                        for (var i = 0; i < data.length; i++) {
                            console.log(data[i]);

                        }

                        var $orderItemsPerOrderDetailsTable = $('#orderItemsPerOrderDetailsTable');

                        if ($orderItemsPerOrderDetailsTable.length) {



                            // console.log('Inside the table!');

                            $orderItemsPerOrderDetailsTable.DataTable({
                                destroy: true,
                                language: persian,
                                lengthMenu: [[3, 5, 10, -1],
                                    ['3 Records', '5 Records', '10 Records', 'ALL']],
                                pageLength: 5,
                                data: data.orderItems,

                                columns: [
                                    {
                                        data: 'product.code',
                                        bSortable: false,
                                        mRender: function (data, type, row) {
                                            return '<img src="' + window.contextRoot
                                                + '/resources/images/' + data
                                                + '.jpg" class="dataTableImg"/>';
                                        }

                                    },
                                    {
                                        data: 'id'

                                    }, {
                                        data: 'product.id'

                                    }, {
                                        data: 'product.name'

                                    }, {
                                        data: 'product.unitPrice'

                                    }, {
                                        data: 'product.discount'

                                    }, {
                                        data: 'buyingPrice'

                                    }, {
                                        data: 'productCount'

                                    }, {
                                        data: 'total'

                                    },
                                    {
                                        data: 'product.id',
                                        mRender: function (data, type, row) {
                                            return '<a href="' + window.contextRoot + '/show/' + data + '/product" class="btn btn-fill-out"><span class="ti ti-eye"></span></a>';

                                        }
                                    }

                                ]
                            });
                        }

                    });
                    $("#unConfirmedOrdersListTable,button").on("click", "#adminViewOrderAddress", function (evt) {
                        var t1 = $("#unConfirmedOrdersListTable").DataTable();
                        var tr = $(this).closest("tr");
                        var row = t1.row(tr);
                        var data = JSON.parse(JSON.stringify(row.data()));

                        var $userOrderAddressModalForAdmin = $('#userOrderAddressModalForAdmin');
                        if ($userOrderAddressModalForAdmin.length) {
                            console.log("here");
                            var userOrderAddressForAdmin = $('#userAddressForAdmin'), userAddress = "";
                            userOrderAddressForAdmin.empty();
                            userAddress = '<address>' + data.shipping.addressLineOne + '<br>' + data.shipping.city + '-' + data.shipping.state + '<br>' + data.shipping.postalCode + '</address>';
                            userOrderAddressForAdmin.append(userAddress);
                        }


                    });
                }
            });
        }
    });

    $('#ConfirmedOrders-tab').click(function () {

        console.log("here");
        var $ConfirmedOrders = $('#ConfirmedOrdersListTable');

        if ($ConfirmedOrders.length) {

            var json = window.contextRoot + '/json/data/admin/orders/1/details';
            console.log(json);

            $ConfirmedOrders.DataTable({
                destroy: true,
                language: persian,
                lengthMenu: [[10, 30, 50, -1], ['10 Records', '30 Records', '50 Records', 'ALL']],
                pageLength: 30,
                ajax: {
                    url: json,
                    dataSrc: ''
                },
                columns: [
                    {
                        data: 'id'

                    },
                    {
                        data: 'user.id'
                    },
                    {
                        data: 'orderTotal',
                        mRender: function (data, type, row) {
                            return data + 'تومان';
                        }
                    },
                    {
                        data: 'shipping',
                        mRender: function (data, type, row) {
                            return '<button type="button" class="btn btn-fill-out" id="adminViewOrderAddress" data-toggle="modal"  data-target="#userOrderAddressModalForAdmin">' +
                                '<span class="ti ti-map"></span></button>';
                        }

                    },
                    {
                        data: 'orderCount'

                    },
                    {
                        data: 'orderDate'

                    },
                    {
                        data: 'status'
                        , bSortable: false,
                        mRender: function (data, type, row) {
                            var str = '';
                            if (data) {
                                str += '<label class="switch"> <input type="checkbox" value="' + row.id + '" checked="checked">  <div class="sliderBox round"> </div></label>';

                            } else {
                                str += '<label class="switch"> <input type="checkbox" value="' + row.id + '">  <div class="sliderBox round"> </div></label>';
                            }

                            return str;
                        }

                    }
                    ,
                    {
                        data: 'orderPostalCode'
                        , mRender: function (data, type, row) {
                        console.log(data);
                        if (!data) {
                            console.log(data);
                            return '<button type="button" class="btn btn-fill-out" id="addPostalCode" data-toggle="modal"  data-target="#addProductPostalCodeModal">' +
                                '<span class="ti ti-plus"></span></button>';


                        } else {
                            return data + '<br><button type="button" class="btn btn-fill-out" id="addPostalCode" data-toggle="modal"  data-target="#addProductPostalCodeModal">' +
                                '<span class="ti ti-pencil" ></span></button>';

                        }


                    }
                    }
                    ,
                    {
                        data: 'orderItems',
                        mRender: function (data, type, row) {


                            return '<button type="button" class="btn btn-fill-out" id="viewProducts" data-toggle="modal"  data-target="#orderItemsListModal">' +
                                '<span class="ti ti-eye"></span></button>';

                        }


                    }

                ],
                initComplete: function () {
                    var api = this.api();
                    api.$('.switch input[type="checkbox"]').on('change', function () {
                        var dText = (this.checked) ? 'You want to activate the order?' : 'You want to de-activate the order?';
                        var checked = this.checked;
                        var checkbox = $(this);

                        bootbox.confirm({
                            size: 'medium',
                            title: 'Rate Activation/Deactivation',
                            message: dText,
                            callback: function (confirmed) {
                                if (confirmed) {
                                    $.ajax({
                                        type: 'GET',
                                        url: window.contextRoot + '/manage/orderDetail/' + checkbox.prop('value') + '/activation',
                                        timeout: 100000,
                                        success: function (data) {
                                            bootbox.alert(data);

                                        },
                                        error: function (e) {
                                            bootbox.alert('ERROR: ' + e);
                                            //display(e);
                                        }
                                    });
                                }
                                else {
                                    checkbox.prop('checked', !checked);

                                }
                            }
                        });
                    });

                    $("#ConfirmedOrdersListTable,button").on("click", "#viewProducts", function (evt) {


                        var t1 = $("#ConfirmedOrdersListTable").DataTable();
                        var tr = $(this).closest("tr");
                        var row = t1.row(tr);
                        var data = JSON.parse(JSON.stringify(row.data()));
                        console.log(data);


                        console.log(data.orderItems);


                        var $orderItemsPerOrderDetailsTable = $('#orderItemsPerOrderDetailsTable');

                        if ($orderItemsPerOrderDetailsTable.length) {



                            // console.log('Inside the table!');

                            $orderItemsPerOrderDetailsTable.DataTable({
                                destroy: true,
                                language: persian,
                                lengthMenu: [[3, 5, 10, -1],
                                    ['3 Records', '5 Records', '10 Records', 'ALL']],
                                pageLength: 5,
                                data: data.orderItems,

                                columns: [
                                    {
                                        data: 'product.code',
                                        bSortable: false,
                                        mRender: function (data, type, row) {
                                            return '<img src="' + window.contextRoot
                                                + '/resources/images/' + data
                                                + '.jpg" class="dataTableImg"/>';
                                        }

                                    },
                                    {
                                        data: 'id'

                                    }, {
                                        data: 'product.id'

                                    }, {
                                        data: 'product.name'

                                    }, {
                                        data: 'product.unitPrice'

                                    }, {
                                        data: 'product.discount'

                                    }, {
                                        data: 'buyingPrice'

                                    }, {
                                        data: 'productCount'

                                    }, {
                                        data: 'total'

                                    },
                                    {
                                        data: 'product.id',
                                        mRender: function (data, type, row) {
                                            return '<a href="' + window.contextRoot + '/show/' + data + '/product" class="btn btn-fill-out"><span class="ti ti-eye"></span></a>';

                                        }
                                    }

                                ]
                            });
                        }


                    });

                    $("#ConfirmedOrdersListTable,button").on("click", "#addPostalCode", function (evt) {


                        var t1 = $("#ConfirmedOrdersListTable").DataTable();
                        var tr = $(this).closest("tr");
                        var row = t1.row(tr);
                        var data = JSON.parse(JSON.stringify(row.data()));
                        console.log(data);


                        console.log(data.orderItems);


                        var $addProductPostalCode = $('#addProductPostalCodeModal');
                        if ($addProductPostalCode.length) {
                            $('#addProductPostalCodeModal #id').val(data.id);
                        }


                    });
                    $("#ConfirmedOrdersListTable,button").on("click", "#adminViewOrderAddress", function (evt) {
                        var t1 = $("#ConfirmedOrdersListTable").DataTable();
                        var tr = $(this).closest("tr");
                        var row = t1.row(tr);
                        var data = JSON.parse(JSON.stringify(row.data()));
                        console.log(data.shipping);

                        var $userOrderAddressModalForAdmin = $('#userOrderAddressModalForAdmin');
                        if ($userOrderAddressModalForAdmin.length) {
                            console.log("here");
                            var userOrderAddressForAdmin = $('#userAddressForAdmin'), userAddress = "";
                            userOrderAddressForAdmin.empty();
                            userAddress = '<address>' + data.shipping.addressLineOne +  '<br>' + data.shipping.city + '-' + data.shipping.state + '<br>' + data.shipping.postalCode + '</address>';
                            userOrderAddressForAdmin.append(userAddress);
                        }


                    });



                }
            });
        }
    });


    //user orders
    $('#userOrders-tab').click(function () {


        var $userOrdersTable = $('#userOrdersTable');

        if ($userOrdersTable.length) {

            var json = window.contextRoot + '/account/user/orders';

            $userOrdersTable.DataTable({
                destroy: true,
                language: persian,
                lengthMenu: [[5, 10, -1], ['5 نتیجه', '10 نتیجه ', 'همه']],
                pageLength: 10,
                ajax: {
                    url: json,
                    dataSrc: ''
                },
                columns: [
                    {
                        data: 'orderDate'

                    },
                    {
                        data: 'status'
                        , bSortable: false,
                        mRender: function (data, type, row) {

                            if (data) {
                                return 'تایید شده';

                            } else {
                                return 'در انتظار تایید';
                            }


                        }

                    }
                    ,
                    {
                        data: 'orderPostalCode'
                    }
                    ,
                    {
                        data: 'orderCount'
                    },
                    {
                        data: 'orderTotal'
                    },
                    {
                        data: 'shipping',
                        mRender: function (data, type, row) {
                            return '<button type="button" class="btn btn-fill-out" id="viewOrderAddress" data-toggle="modal"  data-target="#userOrderAddressModal">' +
                                '<span class="ti ti-map"></span></button>';
                        }
                    }
                    ,
                    {
                        data: 'orderItems',
                        mRender: function (data, type, row) {
                            return '<button type="button" class="btn btn-fill-out" id="viewUserProducts" data-toggle="modal"  data-target="#userOrderItemsListModal">' +
                                '<span class="ti ti-eye"></span></button>';

                        }
                    }
                ],
                initComplete: function () {

                    $("#userOrdersTable,button").on("click", "#viewUserProducts", function (evt) {
                        var t1 = $("#userOrdersTable").DataTable();
                        var tr = $(this).closest("tr");
                        var row = t1.row(tr);
                        var data = JSON.parse(JSON.stringify(row.data()));
                        console.log(data.orderItems);
                        for (var i = 0; i < data.length; i++) {
                            console.log(data[i]);

                        }

                        var $userOrderItemsPerOrderDetailsTable = $('#userOrderItemsPerOrderDetailsTable');

                        if ($userOrderItemsPerOrderDetailsTable.length) {



                            // console.log('Inside the table!');

                            $userOrderItemsPerOrderDetailsTable.DataTable({
                                searching: false,
                                destroy: true,
                                language: persian,
                                data: data.orderItems,

                                columns: [
                                    {
                                        data: 'product.code',
                                        bSortable: false,
                                        mRender: function (data, type, row) {
                                            return '<img src="' + window.contextRoot
                                                + '/resources/images/' + data
                                                + '.jpg" class="dataTableImg"/>';
                                        }

                                    },
                                    {
                                        data: 'product.name'
                                    }
                                    ,
                                    {
                                        data: 'buyingPrice',
                                        mRender: function (data, type, row) {
                                            return row.productCount + '*' + data;
                                        }
                                    },
                                    {
                                        data: 'total'

                                    },
                                    {
                                        data: 'product.id',
                                        mRender: function (data, type, row) {
                                            return '<a href="' + window.contextRoot + '/show/' + data + '/product" class="btn btn-fill-out"><span class="ti ti-eye"></span></a>';

                                        }
                                    }

                                ]
                            });
                        }

                    });
                    $("#userOrdersTable,button").on("click", "#viewOrderAddress", function (evt) {
                        var t1 = $("#userOrdersTable").DataTable();
                        var tr = $(this).closest("tr");
                        var row = t1.row(tr);
                        var data = JSON.parse(JSON.stringify(row.data()));

                        var $userOrderAddressModal = $('#userOrderAddressModal');
                        if ($userOrderAddressModal.length) {
                            console.log("here");
                            var userOrderAddress = $('#userAddress'), userAddress = "";
                            userOrderAddress.empty();
                            userAddress = '<address>' + data.shipping.addressLineOne + '<br>' + data.shipping.city + '-' + data.shipping.state + '<br>' + data.shipping.postalCode + '</address>';
                            userOrderAddress.append(userAddress);
                        }


                    });

                }
            });
        }
    });
    //user rates
    $('#userRates-tab').click(function () {

        var $unConfirmedRates = $('#unConfirmedRatesListTable');

        if ($unConfirmedRates.length) {

            var json = window.contextRoot + '/json/data/admin/allRates';
            console.log(json);

            $unConfirmedRates.DataTable({
                destroy: true,
                language: persian,
                lengthMenu: [[5, 10, -1], ['5 نتیجه','10 نتیجه ','همه']],
                pageLength: 10,
                ajax: {
                    url: json,
                    dataSrc: ''
                },
                columns: [
                    {
                        data: 'timeSent'

                    }
                    ,
                    {
                        data: 'description',
                        mRender: function (data, type, row) {
                            return '<pre>' + data + ' </pre>';
                        }
                    },
                    {
                        data: 'rateNumber'

                    },
                    {
                        data: 'suggestion'
                        , mRender: function (data, type, row) {
                        var string = '';
                        if (data == 0) {
                            string = 'نظری ندارم';
                        } else if (data == -1) {
                            string = 'پیشنهاد نمی کنم';
                        } else {
                            string = 'پیشنهاد می کنم';
                        }
                        return string;
                    }

                    }
                    ,


                    {
                        data: 'active'
                        , bSortable: false,
                        mRender: function (data, type, row) {

                            if (data) {
                                return 'منتشر شده';

                            } else {
                                return 'در انتظار انتشار';
                            }

                        }

                    }
                    ,
                    {
                        data: 'productId'
                        , mRender: function (data, type, row) {

                        return '<a href="' + window.contextRoot + '/show/' + data + '/product" class="btn btn-fill-out"><span class="ti ti-eye"></span></a>';

                    }

                    }




                ]
            });
        }
    });

    $('#provinceSelect').change(function () {

        var provinceName = $(this).val();
        console.log(provinceName);

        $.ajax({

            url: window.contextRoot + "/json/data/province/city?provinceName="+provinceName,

            type: 'get',
            success: function (data) {

                var citySelect = $('#citySelect'), option = "";
                citySelect.empty();


                console.log(data.length);
                for (var i = 0; i < data.length; i++) {
                    option = option + '<option value="' + data[i].name + '">' + data[i].name + '</option>';

                }
                citySelect.append(option);
            },
            error: function () {
                alert("error");
            }
        })
    });

    $('button[name="refreshCart"]').click(function(){
        var cartLineId = $(this).attr('value');
        var countField = $('#count_' + cartLineId);
        var originalCount = countField.attr('value');
        // do the checking only the count has changed
        if(countField.val() !== originalCount) {
            // check if the quantity is within the specified range
            if(countField.val() < 1 || countField.val() > 3) {
                // set the field back to the original field
                countField.val(originalCount);
                bootbox.alert({
                    size: 'medium',
                    title: 'Error',
                    message: 'Product Count should be minimum 1 and maximum 3!'
                });
            }
            else {
                // use the window.location.href property to send the request to the server
                var updateUrl = window.contextRoot + '/cart/' + cartLineId + '/update?count=' + countField.val();
                window.location.href = updateUrl;
            }
        }
    });



});