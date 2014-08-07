/*
    AiwinSlider created by Jose Nino N. Garcia
    Date created: 8-5-2014
    Website: www.aiwin888.com
    Version: 1
    Description: The purpose of this plugin is to show the images from left  to right and if it is 
    greater than the total images from the DOM. This works in IE 7 and above.
*/


(function ($) {
    $(document).ready(function () {
        $.fn.aiwinSlider = function (options) {

            var $this = $(this);
            var listImg = $(this).find("ul");
            var listCont = $(this).find("li");
            var countList = $(this).find("li").length;
            var settings = $.extend({
                nextPrevious: true,
                paging: true,
                animationInterval: 3000
            }, options);


            var containerWidth = listCont.width();
            var assist = 0;
            var intLine = 1;

            $("#paging div:nth-child(0)").addClass("active");

            setInterval(function () {
                if (intLine == countList) {
                    listImg.animate({
                        "margin-left": "0px"
                    });
                    intLine = 1;
                } else {
                    listImg.animate({
                        "margin-left": "-" + intLine++ * containerWidth
                    });
                }
                $("#paging div").removeClass("active");
                $("#paging div:nth-child(" + intLine + ")").addClass("active");
            }, settings.animationInterval);


            $this.append("<div class='next'><img src='assets/right.png'></div>");
            $this.append("<div class='prev'><img src='assets/left.png'></div>");

            if (settings.nextPrevious) {
                $(".next, .prev").show();
            } else {
                $(".next, .prev").hide();
            }

            $(".next").css("position", "absolute");
            $(".next").css("top", "100px");
            $(".next").css("right", "10px");
            $(".prev").css("position", "absolute");
            $(".prev").css("top", "100px");
            $(".prev").css("left", "10px");
            $(".next, .prev").css("cursor", "pointer");

            $(".next").click(function () {
                if (intLine == countList) {
                    listImg.animate({
                        "margin-left": "0px"
                    });
                    intLine = 1;
                } else {
                    listImg.animate({
                        "margin-left": "-" + intLine++ * containerWidth
                    });
                }
            });

            $(".prev").click(function () {
                listImg.animate({
                    "margin-left": "-" + (--intLine) * containerWidth
                });
            });

            $this.append("<div id='paging'></div>");

            if (settings.paging) {
                $("#paging").show();
            } else {
                $("#paging").hide();
            }

            $("#paging").css("position", "absolute");

            for (var i = 0; i < countList; i++) {
                $("#paging").append("<div></div>");
            }

            var pageNum = $("#paging div");

            pageNum.click(function () {
                var index = pageNum.index(this);
                listImg.animate({
                    "margin-left": "-" + index * containerWidth
                });

                intLine = index;
                $("#paging div").removeClass("active");
                $("#paging div:nth-child(" + (index + 1) + ")").addClass("active");
            });
        };

    });
} (jQuery));