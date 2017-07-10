/**
 * 
 */

$(function () {
    $("form.box_search input[name=name]").on("focus", function () {
        $(this).autocomplete({
            minLength: 0,
            source: function (request, response) {
                $.getJSON("/keyword_search.json", {name: request.term}, function (data) {
                    response(data.recipes);
                });
            },
            focus: function (event, ui) {
                event.preventDefault();
            }
        });
    });

    // 전체카테고리 열기
    $('.btn_all, .menu_over .btn_close').click(function () {
        $(this).toggleClass('open');
        $('.menu_over').toggle();
    });
    $('.menu_over').on('click', 'input:checkbox', function () {
        $(this).parent('label').parent('li').toggleClass('checked', this.checked);
    });

    //사용자메뉴 마우스오버
    $('.btn_profile').on("mouseover", function () {
        $('.menu_user').removeClass("show hide").addClass("show");
    });
    $('.btn_profile').on("mouseout", function () {
        $('.menu_user').removeClass("show hide").addClass("hide");
    });

    // 레이어 : 레시피 등록
    $('.btn_add_recipe, .btn_add').click(function () {
        $('.ly_add_from_blog').hide();
        $('.ly_add_recipe').show();
    });
    $('.ly_add_recipe .btn_close').click(function () {
        $('.ly_add_recipe').hide();
    });

    // 레이어 : 레시피등록 - 블로그에서 불러오기
    $('.ly_add_recipe .btn_blog').click(function () {
        $('.ly_add_recipe').hide();
        $('.ly_add_from_blog').show();
    });
    $('.ly_add_from_blog .btn_close').click(function () {
        $('.ly_add_from_blog').hide();
    });

    // 블로그에서 불러오기 URL validation
    $("#fetch_blog").on("submit", function (e) {
        var self = $(this);
        var url = $("input[name=post_url]").val();
        var msg = "이미 등록된 주소입니다. 그래도 계속하시겠습니까?";

        e.preventDefault();

        $.getJSON("/validate_blog_url", {post_url: url}, function (data) {
            if (!data.validation) {
                if (confirm(msg)) {
                    self.unbind('submit').submit();
                }
            } else {
                self.unbind('submit').submit();
            }
        });
    });

    // 알림카운터,알림레이어
    $('.btn_noti').click(function () {
        $('.ly_notification').show();
    });
    $('.ly_notification .btn_close').click(function () {
        $('.ly_notification').hide();
    });

    // 공통 오브젝트 스크립트

    // 레이어: 콜렉션에 추가
    // $('.lst_recipe .like').click(function() {
    // 	$(this).parents('li').children('.ly_collect').show();
    // 	// return false;
    // });
    // $('.ly_collect .btn_close').click(function() {
    // 	$(this).closest('.ly_collect').hide();
    // 	return false;
    // });

    // 레이어: 공유하기
    $(document).on("click", ".share", function () {
        $(this).parents("li").children(".share_on").show();
        return false;
    });
    $(document).on("click", ".share_on .btn_close", function () {
        $(this).closest(".share_on").hide();
        return false;
    });

    // 팔로우하기 및 취소하기
    $(document).on("submit", "form.create-follow", function (e) {
        e.preventDefault();

        var $btn = $(this).find("button");
        var $frm = $(this);
        var $method = $(this).find("input[name=_method]");
        var $parent = $(this).parent();

        $.ajax({
            url: $frm.attr("action") + ".json",
            type: $frm.attr("method"),
            data: $frm.serialize(),
            success: function (data) {
                if (data.follow_status) {
                    $frm.toggleClass("create-follow delete-follow");
                    $frm.attr("action", "/follow/destroy");
                    $frm.attr("method", "delete");
                    $method.val("delete");

                    if ($btn.hasClass("btn_fav_s")) {
                        $btn.toggleClass("btn_fav_s btn_fav_ing_s");
                        $btn.html("<em></em><strong>팔로잉</strong><span>언팔로우</span>");
                    } else {
                        $btn.toggleClass("btn_fav btn_fav_ing");
                        $btn.html("<strong>팔로잉</strong><span>언팔로우</span>");
                    }

                    $parent.parent().find(".follow > em").html(data.follow_count + "명");
                }
            }
        });
    }).on("submit", "form.delete-follow", function (e) {
        e.preventDefault();

        var $btn = $(this).find("button");
        var $frm = $(this);
        var $method = $(this).find("input[name=_method]");
        var $parent = $(this).parent();

        $.ajax({
            url: $frm.attr("action") + ".json",
            type: $frm.attr("method"),
            data: $frm.serialize(),
            success: function (data) {
                if (!data.follow_status) {
                    $frm.toggleClass("create-follow delete-follow");
                    $frm.attr("action", "/follow/create");
                    $frm.attr("method", "post");
                    $method.val("post");

                    if ($btn.hasClass("btn_fav_ing_s")) {
                        $btn.toggleClass("btn_fav_s btn_fav_ing_s");
                        $btn.html("<em></em>팔로우");
                    } else {
                        $btn.toggleClass("btn_fav btn_fav_ing");
                        $btn.html("팔로우");
                    }

                    $parent.parent().find(".follow > em").html(data.follow_count + "명");
                }
            }
        });
    });

    // 냉장고 재료로 추천받기 모달박스 call
    $(document).on("click", ".call_refrigerator", function (e) {
        e.preventDefault();

        var url = $(this).attr("href")
        modal_create(url, "mRef");
    });
    $(document).on("click", ".ly_refrigerator", function (e) {
        e.stopPropagation();
    });

    // 프로필수정 모달박스 call
    $(document).on("click", ".call_profile", function (e) {
        e.preventDefault();

        var url = $(this).attr("href");
        modal_create(url, "mPrf");
    });

    $(document).on("click", ".ly_edit_profile", function (e) {
        e.stopPropagation();
    });
    $(document).on("click", ".close-modal", function () {
        modal_dismiss();
    });

    // 상세페이지 모달박스 call
    $(document).on("click", ".call_recipe", function (e) {
        e.preventDefault();
        var url = $(this).attr("href");
        modal_create(url, "mRcp");
    });

    $(document).on("click", ".call_promotion", function (e) {
        e.preventDefault();
        var url = $(this).attr("href");
        modal_create(url, "mPrm");
    });

    // 상세페이지 이외 스크랩하기 및 취소하기
    $(document).on("submit", "form.create-like", function (e) {
        e.preventDefault();

        var $btn = $(this).find("button");
        var $frm = $(this);
        var $method = $(this).find("input[name=_method]");
        var $parent = $(this).parent();

        $.ajax({
            url: $frm.attr("action") + ".json",
            type: $frm.attr("method"),
            data: $frm.serialize(),
            success: function (data) {
                if (data.bookmark_status) {
                    $parent.addClass("on");
                    $frm.toggleClass("create-like delete-like");
                    $frm.attr("action", "/bookmarks/destroy");
                    $frm.attr("method", "delete");
                    $method.val("delete");
                    $btn.html(data.bookmark_count + "명");
                }
            }
        });
    }).on("submit", "form.delete-like", function (e) {
        e.preventDefault();

        var $btn = $(this).find("button");
        var $frm = $(this);
        var $method = $(this).find("input[name=_method]");
        var $parent = $(this).parent();

        $.ajax({
            url: $frm.attr("action") + ".json",
            type: $frm.attr("method"),
            data: $frm.serialize(),
            success: function (data) {
                if (!data.bookmark_status) {
                    $parent.removeClass("on");
                    $frm.toggleClass("create-like delete-like");
                    $frm.attr("action", "/bookmarks");
                    $frm.attr("method", "post");
                    $method.val("post");
                    $btn.html(data.bookmark_count + "명");
                }
            }
        });
    });

    // 링크로 공유하기
    $(document).on("click", ".url-share", function () {
        url = $(this).attr("data-url");
        prompt("아래 URL을 복사하여(Ctrl+c) 원하는 곳에 붙여넣기(Ctrl+v) 해보세요", url);
    });

    // 레이어 관련 스크립트
    $(document).on("click", "#modal-content", function () {
        modal_dismiss();
    });

    $(document).on("keyup", function (e) {
        if (e.keyCode == 27) {
            if ($("#full-modal-box").hasClass("show")) {
                full_modal_dismiss();
            } else {
                modal_dismiss();
            }
        }
    });

    //	메인 인기카테고리 관련 스크립트
    $(window).load(function () {
        nav_scroller()
    });

    //	메인 배너 스크립트
    var _bOptions = {
        namespace: "haemuk-",
        selector: ".banner-slider > li",
        pauseOnHover: true,
        controlNav: false,
        controlsContainer: ".slide_main .btn_area"
    }

    $(".slide_main").flexslider(_bOptions);
    // banner_align();
    // $(window).on("resize", function() {
    // 	banner_align();
    // });

    //	메인 재료 추천 호출
    call_refrigerator();

    // 소셜 공유 호출
    call_social_share();
});

function call_refrigerator() {
    ga('send', 'pageview', '/refrigerator');

    $(".search-ingre").on("keypress", function (e) {
        return e.keyCode != 13;
    });

    // 냉장고 추천 재료검색
    $(".search-ingre").on("focus", function () {
        var $self = $(this);
        var $field1 = $(this).parent(".field1");
        var $field2 = $field1.next(".field2");
        var $list = $field2.find(".selected-ingre");

        $(this).autocomplete({
            minLength: 1,
            source: function (request, response) {
                // API 테스트용 코드
                // $.getJSON("/api/mobile_main.json", function(data) {
                // 	console.log("recipe = " + JSON.stringify(data));
                // });
                $.getJSON("/search_basefood_by_name", {name: request.term}, function (data) {
                    // console.log("foods = " + JSON.stringify(data));
                    var ingred_list = [];

                    $.each(data, function (index, item) {
                        temp = {
                            "label": item.name,
                            "value": item.id,
                            "image_code": item.image_code,
                            "image_path": item.image_path
                        };
                        ingred_list.push(temp);
                    });

                    response(ingred_list);
                });
            },
            focus: function (event, ui) {
                // $self.val(ui.item.label);
                // return false;
                event.preventDefault();
            },
            select: function (event, ui) {
                // TODO 이미지 코드 반영
                $self.val("");
                $field2.find(".no-content").remove();

                if ($field2.find("[value=" + ui.item.value + "]").length >= 1) {
                    $field2.find("[value=" + ui.item.value + "]").parent("li").remove();

                    if ($list.find("li").length == 0) {
                        $list.append($('<li class="no-content">재료를 선택해주세요.</li>'));
                    }
                } else {

                    $list.append(
                            $("<li>" +
                                    "<input type='hidden' name='basefoods[]' value='" + ui.item.value + "'>" +
                                    "<a href='javascript:;'><em></em><img src='" + ui.item.image_path + "'><strong>" + ui.item.label + "</strong></a>" +
                                    "</li>")
                    );
                }

                return false;
            }
        }).autocomplete("instance")._renderItem = function (ul, item) {
            ul = ul.addClass("ingre-dropdown");

            console.log(item);

            return $("<li>").append("<a href='javascript:;' ingre-id='" + item.value + "'><img src='" + item.image_path + "'>" + item.label + "</a>").appendTo(ul);
        };
    });

    $(".big_sort").on("click", "a", function () {
        var group_id = $(this).attr("data-id");
        var $ingre_list = $(this).closest(".field1").find(".small_sort");
        var $lists = $(this).parent("li").siblings();

        $(this).addClass("selected");
        $lists.each(function (index, item) {
            $(item).find("a").removeClass("selected");
        });

        $ingre_list.empty();

        $.getJSON("/get_bf_group_items.json", {bf_group_id: group_id}, function (data) {
            $.each(data, function (index, item) {
                $ingre_list.append(
                        $('<li><a href="javascript:;" ingre_id="' + item.id + '"><em></em><img src="' + item.image_path + '"</a><strong>' + item.name + '</strong></li>')
                );
            });
        });
    });

    $(".small_sort").on("click", "a", function () {
        var $field1 = $(this).closest(".field1");
        var $field2 = $field1.next(".field2");
        var $list = $field2.find(".selected-ingre");
        var id = $(this).attr("ingre_id");
        var name = $(this).find("strong").html();
        var imgHtml = $(this).find("img").prop("outerHTML");

        if ($(this).hasClass("selected")) {
            $(this).removeClass("selected");
            $field2.find("input[value=" + id + "]").parent("li").remove();

            if ($list.find("li").length == 0) {
                $list.append($('<li class="no-content">재료를 선택해주세요.</li>'));
            }
        } else {
            $(this).addClass("selected");
            $field2.find(".no-content").remove();
            $field2.find(".selected-ingre").append(
                    $("<li>" +
                            "<input type='hidden' name='basefoods[]' value='" + id + "'>" +
                            "<a href='javascript:;'><em></em>" + imgHtml + name + "</strong></a>" +
                            "</li>")
            );
        }
    });

    $(".selected-ingre").on("click", "a", function () {
        var $field2 = $(this).closest(".field2");
        var $list = $field2.find(".selected-ingre");
        var id = $(this).parent("li").find("input[type=hidden]").val();

        $(this).parent("li").remove();

        if ($list.find("li").length == 0) {
            $list.append($('<li class="no-content">재료를 선택해주세요.</li>'));
        }

        $field2.prev(".field1").find("a[ingre_id=" + id + "]").removeClass("selected");
    });
}

function banner_align() {
    var viewSize = $(window).width();

    if (viewSize < 1920) {
        compensation = (1920 - viewSize) / 2;
        $(".banner-slider li img").css("margin-left", -compensation);
    }
}

function nav_scroller() {
    var containerLenghth = 660;
    var moveAmount;
    var catWidth = 0;

    $(".popular-cats li").each(function (index) {
        addedWidth = $(this).outerWidth(true);
        catWidth = catWidth + addedWidth;
    });

    if (catWidth > containerLenghth) {
        moveAmount = catWidth - containerLenghth;

        $(".bar_gnb .btn_prev").on("click", function () {
            $(".popular-cats").animate({
                left: 0
            });
        });

        $(".bar_gnb .btn_next").on("click", function () {
            $(".popular-cats").animate({
                left: -moveAmount
            });
        });
    }
}

function nav_scroller_future() {
    var containerLenghth = 660;
    var moveAmount, position;
    var catWidth = 0, liCount = 0;
    var fullList = "", smList = "", bundleList = "";

    $(".popular-cats li").each(function (index) {
        catWidth = catWidth + $(this).outerWidth(true);

        if (catWidth > containerLenghth || index == ($(".popular-cats li").length - 1)) {
            catWidth = 0;

            if (liCount == 0) {
                smList = "<li class='show'><ul>" + bundleList + "</ul></li>";
            } else {
                smList = "<li class='hide'><ul>" + bundleList + "</ul></li>";
            }

            fullList += smList;
            smList = "";
            bundleList = "";
            liCount++;
        } else {
            bundleList += $(this).prop("outerHTML");
        }
    });

    $(".popular-cats").empty().append($(fullList));


    $(".bar_gnb .btn_prev").on("click", function () {
        if ($(".popular-cats > li.show").prev("li").length != 0) {
            $(".popular-cats > li.show").toggleClass("show hide").prev("li").toggleClass("show hide");
        } else {
            $(".popular-cats > li.show").toggleClass("show hide");
            $(".popular-cats > li:last-child").toggleClass("show hide");
        }
    });

    $(".bar_gnb .btn_next").on("click", function () {
        if ($(".popular-cats > li.show").next("li").length != 0) {
            $(".popular-cats > li.show").toggleClass("show hide").next("li").toggleClass("show hide");
        } else {
            $(".popular-cats > li.show").toggleClass("show hide");
            $(".popular-cats > li:first-child").toggleClass("show hide");
        }
    });
}

function validate_email(email) {
    var pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
    var result = {
        validate: false,
        msg: ""
    };

    if (!pattern.test(email)) {
        if (email == "") {
            result.msg = "이메일 주소를 입력해주세요.";
        } else {
            result.msg = "잘못된 이메일 형식입니다.";
        }
    } else {
        result.validate = true;
    }

    return result;
}

function validate_password(password) {
    var result = {
        validate: false,
        msg: ""
    };

    if (password == "") {
        result.msg = "비밀번호를 입력해주세요.";
    } else {
        if (password.length < 8) {
            result.msg = "비밀번호는 8자리 이상을 입력하셔야합니다.";
        } else {
            result.validate = true;
        }
    }

    return result;
}

function modal_dismiss() {
    $("#modal-box, #modal-content, #modal-editor").removeClass("hide show").addClass("hide");
    $("#modal-content, #modal-editor .default").empty();
    $("body").removeClass("modal-open");
}

function modal_scroll_top() {
    $("#modal-content").animate({
        scrollTop: 0
    });
}

function modal_create(url, type) {
    var urlCmp = "";
    var callBack = null;

    switch (type) {
        case "mPrm":
            urlCmp = " .ly_promotion";
            callBack = function () {
                // 원래 레시피 상세 레이어를 위해 만든 콜백이지만, 주요 기능이 비슷한 것들이 많기 때문에 그냥 같이 참조한다
                recipe_callback(url, true);
            }
            break;
        case "mRcp":
            urlCmp = " .ly_recipe";
            callBack = function () {
                recipe_callback(url, true);
            }
            break;
        case "mPrf":
            urlCmp = " .ly_profile";
            callBack = function () {
                profile_callback();
            }
            break;
        case "mRef":
            urlCmp = " .ly_refrigerator";
            callBack = function () {
                call_refrigerator();
            }
            break;
        default:
            break;
    }
    console.log(url + urlCmp);
    $("#modal-content").empty().load(url + urlCmp, function (response, status, xhr) {
        if (status == "error") {
            alert("오류가 발생했습니다. 잠시후 다시 시도해 주세요. (" + xhr.status + " : " + xhr.statusText + ")");
        } else {
            $("body").addClass("modal-open");
            if (callBack != null) {
                callBack();
            }
            modal_scroll_top();
            $("#modal-box, #modal-content").removeClass("hide show").addClass("show");
        }
    });
}

function full_modal_dismiss() {
    $("#full-modal-box").removeClass("hide show").addClass("hide");
    $(".view_recipe").css("overflow", "hidden");
}

function open_full_layout(id) {
    $("#full-modal-box").empty().load("/recipes/" + id + "/enlarged .grid_full", function (response, status, xhr) {
        if (status == "error") {
            alert("오류가 발생했습니다. 잠시후 다시 시도해 주세요. (" + xhr.status + " : " + xhr.statusText + ")");
        } else {
            $("#full-modal-box").removeClass("hide show").addClass("show");
            $(".view_recipe").css("overflow", "visible");
            full_recipe_callback();
        }
    });
}

function switch_recipe_layout(layout) {
    switch (layout) {
        case "blog":
            if ($("ol.lst_step").hasClass("grid")) {
                $(".grid-mode").removeClass("on");
                $(".blog-mode").addClass("on");
                $("ol.lst_step").removeClass("grid");
            }
            break;
        case "grid":
            if (!$("ol.lst_step").hasClass("grid")) {
                $(".grid-mode").addClass("on");
                $(".blog-mode").removeClass("on");
                $("ol.lst_step").addClass("grid");
            }
            break;
        case "full":
            break;
    }
}

function recipe_callback(url, isModal) {
    // 모달에서 호출시 GA에 pageview 요청
    if (isModal) {
        ga('send', 'pageview', url);
    }

    // 내용 클릭시 modal_dismiss방지
    $(".view_recipe").on("click", function (e) {
        e.stopPropagation();
    });

    $(".btn_ly_close").on("click", function (e) {
        e.stopPropagation();
        modal_dismiss();
    });

    $(".btn_top").on("click", function (e) {
        e.stopPropagation();
        modal_scroll_top();
    });

    // 상단 이미지 slider
    $("#carousel").flexslider({
        animation: "slide",
        controlNav: false,
        animationLoop: false,
        slideshow: false,
        itemWidth: 102,
        itemHeight: 102,
        itemMargin: 9,
        maxItem: 5,
        asNavFor: '#slider'
    });
    $("#slider").flexslider({
        animation: "slide",
        controlNav: false,
        animationLoop: false,
        slideshow: false,
        sync: "#carousel",
        start: function (slider) {
            $('body').removeClass('loading');
        }
    });

    //영양정보 영역 그래프
    $('.nutrition li').each(function () {
        $(this).attr({
            'data-width': 8,
            'data-dimension': 125,
            'data-fontsize': 30,
            'data-bgcolor': '#c5c5c5'
        }),
                $(this).circliful();
    });

    // 상세페이지 스크랩하기 및 취소하기
    $(".btn_area").on("submit", "form.create-scrap", function (e) {
        e.preventDefault();

        var recipe_id = $(this).find("input[name=recipe_id]").val();
        var $btn = $(this).find("button");
        var $frm = $(this);
        var $method = $(this).find("input[name=_method]");
        var $counter = $("#scrap-cnt");
        var $orgCard = $("form.create-like").find("input[value=" + recipe_id + "]").parent("form");

        $.ajax({
            url: $frm.attr("action") + ".json",
            type: $frm.attr("method"),
            data: $frm.serialize(),
            success: function (data) {
                if (data.bookmark_status) {
                    $frm.toggleClass("create-scrap delete-scrap");
                    $frm.attr("action", "/bookmarks/destroy");
                    $frm.attr("method", "delete");
                    $method.val("delete");
                    $btn.toggleClass("btn_scrap btn_unscrap").html("스크랩취소");
                    $counter.html(data.bookmark_count);

                    $orgCard.parent().addClass("on");
                    $orgCard.toggleClass("create-like delete-like");
                    $orgCard.attr("action", "/bookmarks/destroy");
                    $orgCard.attr("method", "delete");
                    $orgCard.find("input[name=_method]").val("delete");
                    $orgCard.find("button").html(data.bookmark_count + "명");
                }
            },
            error: function (obj) {
                console.log("error : " + obj.responseText);
                json = $.parseJSON(obj.responseText);
                alert(json.message);
            }
        });
    }).on("submit", "form.delete-scrap", function (e) {
        e.preventDefault();

        var recipe_id = $(this).find("input[name=recipe_id]").val();
        var $btn = $(this).find("button");
        var $frm = $(this);
        var $method = $(this).find("input[name=_method]");
        var $counter = $("#scrap-cnt");
        var $orgCard = $("form.delete-like").find("input[value=" + recipe_id + "]").parent("form");

        $.ajax({
            url: $frm.attr("action") + ".json",
            type: $frm.attr("method"),
            data: $frm.serialize(),
            success: function (data) {
                if (!data.bookmark_status) {
                    $frm.toggleClass("create-scrap delete-scrap");
                    $frm.attr("action", "/bookmarks");
                    $frm.attr("method", "post");
                    $method.val("post");
                    $btn.toggleClass("btn_scrap btn_unscrap").html("스크랩하기");
                    $counter.html(data.bookmark_count);

                    $orgCard.parent().removeClass("on");
                    $orgCard.toggleClass("create-like delete-like");
                    $orgCard.attr("action", "/bookmarks");
                    $orgCard.attr("method", "post");
                    $orgCard.find("input[name=_method]").val("post");
                    $orgCard.find("button").html(data.bookmark_count + "명");
                }
            },
            error: function (obj) {
                console.log("error : " + obj.responseText);
                json = $.parseJSON(obj.responseText);
                alert(json.message);
            }
        });
    });

    // 소셜 공유하기
    call_social_share();

    //신고하기 버튼/레이어
    // $('.btn_report').click(function() {
    // 	$('.ly_report').show();
    // 	return false;
    // });
    // $('.ly_report .btn_close').click(function() {
    // 	$('.ly_report').hide();
    // 	return false;
    // });

    // 댓글남기기
    $(".sec_comment").on("submit", "form.comment_write_box", function (e) {
        e.preventDefault();

        var $frm = $(this);
        var content = $(this).find("textarea").val();

        if (content.replace(/\s+/g, "") != "") {
            $.ajax({
                type: $frm.attr("method"),
                url: $frm.attr("action"),
                data: $frm.serialize(),
                success: function (data) {
                    $(".sec_comment").empty().append($(data).find(".sec_comment"));
                }
            });
        }
    });

    // 대댓글 박스 토글
    $(".sec_comment").on("click", ".btn_reply", function () {
        var $btn_reply = $(this);
        var $box_reply = $(this).siblings(".box_reply");

        if ($box_reply.hasClass("hide")) {
            $btn_reply.text("댓글접기");
            $box_reply.removeClass("hide").addClass("show");
        } else {
            $btn_reply.text("댓글달기");
            $box_reply.removeClass("show").addClass("hide");
        }
    });

    // 대댓글 남기기
    $(".sec_comment").on("submit", "form.box_reply", function (e) {
        e.preventDefault();

        var $frm = $(this);
        var content = $(this).find("textarea").val();

        if (content.replace(/\s+/g, "") != "") {
            $.ajax({
                type: $frm.attr("method"),
                url: $frm.attr("action"),
                data: $frm.serialize(),
                success: function (data) {
                    $(".sec_comment").empty().append($(data).find(".sec_comment"));
                }
            });
        }
    });

    // 댓글 페이지 이동
    $(".sec_comment").on("click", ".paging a", function (e) {
        e.preventDefault();
        var url = $(this).attr("href");

        $.ajax({
            type: "get",
            url: url,
            success: function (data) {
                $(".sec_comment").empty().append($(data).find(".sec_comment"));
            }
        });
    });

    //재료리스트 scroll fix : 150324
    $("img").load(function () {
        var htmlLength = $('.sec_detail').outerHeight(true);
        var ingreLenght = $(".aside .btm").outerHeight(true);
        var btm_offset = $(".aside .top").outerHeight(true) + $(".aside .mid").outerHeight(true);
        var marginComp = (1048 / 2) - 280;
        var max_scroll = htmlLength - ingreLenght;
        var $target = (isModal) ? $("#modal-content") : $(window);
        $(".sec_info").height(htmlLength);


        if (!isModal) {
            btm_offset += 113; // inpage에서 로딩시 헤더 높이 만큼 compensation
            marginComp += 8.5;
        }

        $target.scroll(function () {
            var scroll = $(this).scrollTop();

            if (scroll < btm_offset) {
                $('.btm').css({
                    'position': 'relative',
                    'top': '0',
                    'left': '0',
                    'margin-left': '0'
                });
            } else if (scroll >= max_scroll) {
                $('.btm').css({
                    'position': 'absolute',
                    'bottom': '0',
                    'top': 'auto',
                    'left': '0',
                    'margin-left': '0'
                });
            } else {
                $('.btm').css({
                    'position': 'fixed',
                    'top': '0',
                    'left': '50%',
                    'margin-left': marginComp
                });
            }
        });
    });
}

function full_recipe_callback() {
    var length = $(".grid_full .img_area img").length;

    $(".mode_view .big").on("click", function () {
        switch_recipe_layout("blog");
        full_modal_dismiss();
    });
    $(".mode_view .grid").on("click", function () {
        switch_recipe_layout("grid");
        full_modal_dismiss();
    });

    $(".grid_full .btn_prev, .grid_full .btn_next").on("click", function () {
        var target = parseInt($(this).attr("data-target"));
        var prev = (target + length - 1) % length;
        var next = (target + length + 1) % length;
        var $img = $(".grid_full .img_area").find("[data-seq=" + target + "]");
        var $desc = $(".grid_full .dsc_area").find("[data-seq=" + target + "]");

        $img.removeClass("hide").siblings("img").addClass("hide");
        $desc.removeClass("hide").siblings().addClass("hide");

        $(".grid_full .btn_prev").attr("data-target", prev);
        $(".grid_full .btn_next").attr("data-target", next);
    });
}

function profile_callback() {
    // GA에 pageview 카운트
    ga('send', 'pageview', '/users/edit');

    // Uploadify 관련 함수
    var app = window.app ? window.app : {};
    app["session_key"] = $("#uploadify-key").val();
    app["session_val"] = $("#uploadify-val").val();
    csrf_token = $('meta[name=csrf-token]').attr('content');
    csrf_param = $('meta[name=csrf-param]').attr('content');
    var uploadify_script_data = {};
    uploadify_script_data[csrf_param] = encodeURI(csrf_token);
    uploadify_script_data[app["session_key"]] = app["session_val"];

    $("#upload-avatar").uploadify({
        'swf': '/_flash/uploadify.swf',
        'uploader': '/avatar_save.json',
        'formData': uploadify_script_data,
        'cancelImg': '/_img/uploadify-cancel.png',
        'buttonClass': 'btn_upload_pic',
        'width': 130,
        'height': 130,
        'buttonText': '',
        'fileExt': '*.png;*.jpg;*.gif',
        'multi': false,
        'method': 'post',
        'onUploadSuccess': function (file, data, response) {

            if (response) {
                var img = JSON.parse(data).image_file.thumb.url;
                $(".ly_edit_profile .info_top").find("img").attr("src", img);
            }

        }
    });
}
