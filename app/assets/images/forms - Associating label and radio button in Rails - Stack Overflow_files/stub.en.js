'use strict';window.StackExchange={};function MSIsPlayback(){try{return parent&&parent.WebPlayer}catch(d){return!1}}if(!MSIsPlayback()&&top!=self)throw top.location.replace(document.location),$(function(){$("head").add("body").remove()}),alert("For security reasons, framing is not allowed; click OK to remove the frames."),Error();
StackExchange.init=function(){function d(){$(document).on("click",".convert-to-post",function(a){a.preventDefault();a=$(this).attr("data-confirm");(!a||confirm(a))&&$("<form method='post'/>").attr("action",$(this).attr("href")).appendTo("body").append($("<input type='hidden' name='fkey' />").attr("value",$(this).attr("data-fkey"))).submit()})}function a(){function a(g){StackExchange.options.user.fkey!==g&&(StackExchange.options.user.fkey=g,$("input[name=fkey]").val(g))}function c(){var a=localStorage.getItem(g);
if(!a)return{time:0};a=a.split(/,/);return{fkey:a[0],time:parseInt(a[1],10)}}var g="se:fkey";$(window).on("storage",function(c){c=c.originalEvent;c.key==g&&c.newValue&&a(c.newValue.split(/,/)[0])});try{var d=StackExchange.options.user.fkey,h=c();if(h.fkey!==d)if(StackExchange.options.serverTime>h.time)try{localStorage.setItem(g,d+","+StackExchange.options.serverTime)}catch(e){}else a(h.fkey)}catch(f){}}function c(){if(StackExchange.options.timingsGuid&&window.performance&&window.performance.timing){var a=
window.performance.timing,c=a.navigationStart,g={guid:StackExchange.options.timingsGuid,Info:StackExchange.options.timingsInfo},d;for(d in a)0!==a[d]&&(g[d]=0===a[d]?null:a[d]-c);$.post("/client-timings",g)}}var e=function(a){if(!window.jQuery)if("complete"!=document.readyState)setTimeout(function(){e(a)},1E3);else{var c=document.createElement("div");c.id="noscript-padding";var g=document.createElement("div");g.id="noscript-warning";g.innerHTML=a+" requires external JavaScript from another domain, which is blocked or failed to load.";
document.body.insertBefore(c,document.body.firstChild);document.body.appendChild(g)}},f=function(){var a=function(a){a?$(a).trigger("popupClose").fadeOutAndRemove():($("#lightbox:not(.no-esc-remove), .message-dismissable, .popup:not(.no-auto-close), .share-tip, .esc-remove").fadeOutAndRemove(),$(".esc-hide").fadeOut(),window.genuwine&&genuwine.isVisible()&&genuwine.click(),window.profileLink&&profileLink.hide(),StackExchange.topbar&&StackExchange.topbar.hideAll(),$("#lightbox:not(.no-esc-remove), .message-dismissable, .popup:not(.no-auto-close), .share-tip, .esc-remove, .esc-hide").trigger("popupClose",
{closeTrigger:"esc"}))};$(document).keyup(function(c){27==c.which&&a()});$("body").mousedown(function(a){var g=$(a.target);if(!g.closest(".ac_results, .popup").length){if(!g.closest(".popup").length){if(1!=a.which)return;$(".popup:not(.no-auto-close), #lightbox").fadeOutAndRemove().trigger("popupClose",{closeTrigger:"click outside"})}g.closest(".share-tip").length||$(".share-tip").fadeOutAndRemove().trigger("popupClose",{closeTrigger:"click outside"});g.closest(".wmd-prompt-dialog").length||$(".wmd-prompt-dialog, .wmd-prompt-background").fadeOutAndRemove().trigger("popupClose",
{closeTrigger:"click outside"})}});$(document).bind("closePopups",function(c){a(c.selectorToClose)})},l=function(){var a=$("#hlinks"),c=$("#search input[name=q]"),g=c.width(),d=2.5*g,h,e=function(a){c.queue("expand",a)},f=!1,l=!("placeholder"in document.createElement("input"));l&&!StackExchange.options.isMobile&&(""==c[0].value&&(c[0].value="search"),c.bind({focus:function(){"search"==this.value&&(this.value="")}}));c.keydown(function(g){if(f||46>g.keyCode&&8!=g.keyCode&&32!=g.keyCode)return!0;f=
!0;clearTimeout(h);c.clearQueue("expand");e(function(g){c[0].placeholder="";a.fadeOut(100,g)});e(function(a){c.animate({width:d,"max-width":d},100,a)});e(function(){0==c.parent().find(".search-prompt").length&&c.before('<span class="search-prompt">search:</span>')});3==c.queue("expand").length&&c.dequeue("expand")}).focusout(function(){h=setTimeout(function(){e(function(a){c.parent().find(".search-prompt").remove();a()});e(function(a){c.animate({width:g,"max-width":g},100,a)});e(function(g){l&&""==
c[0].value&&(c[0].value="search");c[0].placeholder="search";a.fadeIn(100,g)});3==c.queue("expand").length&&c.dequeue("expand");f=!1},200)});$("#search").keydown(function(a){if(13==a.which&&a.ctrlKey&&c.val())return window.open("/search?q="+encodeURIComponent(c.val()),"_newtab"),!1}).find("input[name=q]").keyup(function(a){27==a.which&&$(this).blur()})};return function(j){StackExchange.options=j;j.serverTimeOffsetSec=j.serverTime-(new Date).getTime()/1E3;e(j.site.name);$.ajaxSetup({cache:!1});StackExchange.init.createJqueryExtensions();
j.enableLogging=j.user.isEmployee&&"undefined"!==typeof console&&"undefined"!==typeof console.log;$(function(){f();l();a();d();StackExchange.using(StackExchange.options.user.isAnonymous?"anonymous":"loggedIn",function(){StackExchange.initialized.resolve()},!0,j.fullPostfix);var e=StackExchange.options.styleCodeAdditionalLang;e&&StackExchange.ifUsing("prettify",function(){return StackExchange.loadJsFile("third-party/prettify/additional-langs/"+e)});StackExchange.ready(function(){genuwine.init(j.user.accountId||
null,j.user.inboxUnviewedCount,j.user.notificationsUnviewedCount);j.user.messages&&StackExchange.notify.showMessages(j.user.messages,j.isMobile);j.site.globalAuthDisabled||(!j.site.isChildMeta&&j.user.isAnonymous&&gauth.checkStackAuth(j.stackAuthUrl),gauth.informStackAuth(j.stackAuthUrl));j.user.isAnonymous||profileLink.init(j.user.gravatar,j.isMobile,j.user.profileUrl+"?tab=activity",j.serverTimeOffsetSec);j.enableUserHovercards&&StackExchange.usermenu.init();StackExchange.tagPreferences?StackExchange.tagPreferences.init():
StackExchange.tagmenu.init();j.timingsGuid&&$(window).load(function(){setTimeout(c,50)});$("*[data-tracker]").track()})})}}();
StackExchange.debug={log:function(){},init:function(){this.log=function(d){$(function(){var a=$("#debug-messages");a.length||(a=$("<div id='debug-messages' style='text-align:left;position:fixed;top:50px;left:50px;z-index:1000;background:white;border:2px solid black;width:300px;padding:10px;' />").append($("<span style='cursor:pointer;color:#999'>(close debug messages)</span>").click(function(){$("#debug-messages").remove()})).appendTo("body"));$("<div style='margin-top:10px' />").text(d).appendTo(a)})}}};
StackExchange.initialized=$.Deferred();StackExchange.ready=function(d){StackExchange.initialized.done(d)};if(window.serq)for(var i=0;i<window.serq.length;i++)StackExchange.ready(window.serq[i]);
(function(){var d={anonymous:"full-anon.js",loggedIn:"full.js",prettify:"prettify-full.js",pseudoModerator:"moderator.js",inlineEditing:"full.js",editor:"wmd.js",autocomplete:"third-party/jquery.autocomplete.min.js",tagAutocomplete:"tageditor.js",tagEditor:"tageditornew.js",tagSuggestions:"tagsuggestions.js",mobile:"mobile.js",help:"help.js",inlineTagEditing:"inline-tag-editing.js",mathjaxEditing:"mathjax-editing.js",revisions:"revisions.js",mockups:"external-editor.js",schematics:"external-editor.js",
review:"review.js",translation:"full.js",gps:"full-anon.js",postValidation:"post-validation.js",exploreQuestions:"explore-qlist.js",eventCharts:"events.js",virtualKeyboard:"virtual-keyboard.js"},a={},c={},e,f={},l=function(a,g){return function(c){var h=a[c];h||(h=a[c]=g(c));return h}},j=function(g){var g=a[g],c,h=$.Deferred(),d=$.when(h),e;if(g)for(c=0;c<g.length;c++)(e=g[c].call(null))&&$.isFunction(e.promise)&&(d=$.when(d,e));h.resolve();return d},k=function(){if(!e){var a=$("script[src]").filter(function(){return/stub.*\.js/.test($(this).attr("src"))}).first();
0==a.length?(StackExchange.debug.log("couldn't figure out location of stub.js"),e="/content/js/"):e=a.attr("src").replace(/\/stub.*\.js.*$/,"/")}return e},g=function(a){a&&StackExchange.options.locale&&-1==a.indexOf("third-party")&&(a=a.replace(/^(.*)(.js)(\?.*)?$/,"$1."+StackExchange.options.locale+"$2$3"));return a},n=function(a){var c=$.Deferred(),h=document.createElement("script");h.async="async";h.src=g(a);h.onload=h.onreadystatechange=function(a,g){if(!h.readyState||/loaded|complete/.test(h.readyState))g?
c.reject():c.resolve()};h.onerror=function(){c.reject()};$("head")[0].appendChild(h);return c.promise()},h=function(a){a=d[a];return!a?$.Deferred().reject().promise():u(a)},u=l({},function(a){var c=k()+a;var a=g(a),h=f["js/"+a];h?a="?v="+h:(StackExchange.debug.log("no cache breaker for "+a),a="");return n(c+a)}),v=l({},function(a){function c(){(d=StackExchange[a])?j(a).done(function(){g.resolve()}):0<e?(e--,StackExchange.debug.log("retrying "+a),setTimeout(c,20)):(StackExchange.debug.log("object "+
a+" not available although file was loaded"),g.reject())}var g=$.Deferred(),d=StackExchange[a],e=3;d?g.resolve():h(a).done(c).fail(g.reject);return g.promise()}),s=$.Deferred(),t=function(a,g,c,h){if(!c&&!s.isResolved())s.done(function(){t(a,g)});else{if(c)for(var e in d)d.hasOwnProperty(e)&&(d[e]=d[e].replace(/^(full(?:-anon)?).js$/,"$1"+(h||"")+".js"));h=v(a);c?s.resolve():h=$.when(h,StackExchange.initialized);h.done(function(){g()}).fail(function(){StackExchange.debug.log("failed to provide object "+
a)});return h}};t.setCacheBreakers=function(a){for(var g in a)a.hasOwnProperty(g)&&(f[g]=a[g])};StackExchange.using=t;StackExchange.ifUsing=function(g,h,d){if("undefined"!==typeof d){if(c["u_"+d])return;c["u_"+d]=!0}StackExchange[g]?h():((d=a[g])||(d=a[g]=[]),d.push(h))};StackExchange.loadJsFile=function(a){return n(k()+a)}})();
String.prototype.formatUnicorn=function(){var d=this.toString();if(!arguments.length)return d;var a=typeof arguments[0],a="string"==a||"number"==a?Array.prototype.slice.call(arguments):arguments[0],c;for(c in a)d=d.replace(RegExp("\\{"+c+"\\}","gi"),a[c]);return d};String.prototype.truncate=function(d,a){var c=this.toString();d&&c.length>d&&(c=c.substr(0,d)+a);return c};String.prototype.splitOnLast=function(d){d=this.lastIndexOf(d);return 0>d?[this]:[this.substr(0,d),this.substr(d)]};
String.prototype.contains=function(d){return-1<this.indexOf(d)};
StackExchange.init.createJqueryExtensions=function(){var d=StackExchange.helpers;$.extend($.expr[":"],{working:function(a){a=$(a).data("working");return"undefined"!==typeof a&&a},data:function(a,c,d){c=d[3];a=$(a).data(c);switch(typeof a){case "undefined":return!1;case "boolean":return a;case "object":return null!==a}return!0},containsCI:function(a,c,d){return 0<=jQuery(a).text().toUpperCase().indexOf(d[3].toUpperCase())}});$.fn.extend({working:function(a){return this.each(function(){$(this).data("working",a)})},
track:function(){return this.each(function(){var a=$(this),c=a.is("a[href]")?a:a.find("a[href]"),d=a.data("tracker");c.each(function(){var a=this.href.splitOnLast("#"),c=a[0];this.href=c+=(c.contains("?")?"&":"?")+d+(a[1]||"")})})},fadeOutAndRemove:function(){return this.each(function(){var a=$(this);a.fadeOut("fast",function(){a.trigger("removing").remove()})})},charCounter:function(a){return this.each(function(){var c=a.target?$(a.target):$(this).parents("form").find("span.text-counter"),e=this;
$(this).bind("blur focus keyup paste charCounterUpdate",d.DelayedReaction(function(){var d=a.min,l=a.max,j=a.setIsValid||function(){},k=e.value?e.value.replace(/\r\n/g,"\n").length:0,g=k>0.8*l?"supernova":k>0.6*l?"hot":k>0.4*l?"warm":"cool",n="";0==k?0==d?(n=function(a){return 1==a.max?"enter up to "+a.max+" charcter":"enter up to "+a.max+" charcters"}({max:l}),j(!0)):(n=function(a){return 1==a.min?"enter at least "+a.min+" character":"enter at least "+a.min+" characters"}({min:d}),j(!1)):k<d?(n=
d-k+" more to go...",j(!1)):(d=l-k,n=0<=d?function(a){return 1==a.count?a.count+" character left":a.count+" characters left"}({count:d}):function(a){return 1==a.count?"too long by "+a.count+" character":"too long by "+a.count+" characters"}({count:Math.abs(d)}),j(k<=l));c.text(n);c.hasClass(g)||c.removeClass("supernova hot warm cool").addClass(g)},100,{sliding:!0}).trigger)})},selectRange:function(a,c){return this.each(function(){if(this.setSelectionRange)this.focus(),this.setSelectionRange(a,c);
else if(this.createTextRange){var d=this.createTextRange();d.collapse(!0);d.moveEnd("character",c);d.moveStart("character",a);d.select()}})},addSpinner:function(a){return this.each(function(){d.addSpinner(this,a)})},addSpinnerAfter:function(a){return this.each(function(){$(this).after(d.getSpinnerImg(a))})},addSpinnerBefore:function(a){return this.each(function(){$(this).before(d.getSpinnerImg(a))})},removeSpinner:function(){return this.each(function(){$(this).find("img.ajax-loader").remove()})},
showErrorMessage:function(a,c){return this.each(function(){d.showErrorMessage(this,a,c)})},showErrorPopup:function(a,c){return this.each(function(){d.showErrorMessage(this,a,c)})},showInfoMessage:function(a,c){return this.each(function(){d.showInfoMessage(this,a,c)})},center:function(a){var a=a||{},c=this.parent();"static"===c.css("position")&&(c=c.offsetParent());var c=c.offset(),d=$(window),a=a.top||Math.max((d.height()-this.outerHeight())/2+d.scrollTop()-c.top+(a.dy||0),0);this.css("position",
"absolute");this.css("top",a+"px");this.css("left",Math.max(20,(d.width()-this.outerWidth())/2+d.scrollLeft()-c.left)+"px");a="calc(50% - "+this.outerWidth()/2+"px)";this.css("left",a);this.css("left","-webkit-"+a);return this},helpOverlay:function(){d.bindHelpOverlayEvents(this);return this},hideHelpOverlay:function(){d.hideHelpOverlay(this);return this},enable:function(){0==arguments.length||arguments[0]?this.removeAttr("disabled").css("cursor","pointer").removeClass("disabled-button"):this.attr("disabled",
"disabled").css("cursor","default").addClass("disabled-button");return this},disable:function(){return this.enable(!1)},loadPopup:function(a){var c=this;c.addSpinnerAfter({padding:"0 3px"});$.ajax({type:"GET",url:a.url,dataType:"html",success:function(d){var f=$(d).elementNodesOnly();f.find(".popup-actions-cancel, .popup-close a").click(function(){StackExchange.helpers.closePopups(".popup");a.lightbox&&$("#lightbox").fadeOutAndRemove()});f.find("input:radio[disabled=disabled] + label.action-label").addClass("action-disabled");
a.hideDescriptions&&f.find("ul.action-list > li:not(.action-selected) .action-desc").hide();d=f.find("input:radio:not(.action-subform input)");d.closest("li").bind("hide-action",function(){var c=$(this),g=".action-subform"+(a.hideDescriptions?", .action-desc":"");c.removeClass("action-selected").find(g).slideUp("fast")}).bind("show-action",function(){var c=$(this);c.hasClass("action-selected")||(c.siblings(".action-selected").trigger("hide-action"),c.addClass("action-selected").find(".action-subform").slideDown("fast",
function(){a.subformShow&&a.subformShow($(this));if(a.subformFocusInput){var c=$(this).find("input[type=text], textarea").not(".actual-edit-overlay").eq(0);c.length&&c.focus()}}),a.hideDescriptions&&c.find(".action-desc").slideDown("fast"),a.actionSelected&&a.actionSelected(c),f.find(".popup-submit").enable())});d.click(function(){$(this).closest("li").trigger("show-action")});f.appendTo(c.parent());a.loaded&&a.loaded(f);d=function(){};if(a.subformShow){var l=f.find("li.action-selected .action-subform");
0<l.length&&(d=function(){l.each(function(){a.subformShow($(this))})})}if(a.lightbox){var j=$('<div id="lightbox"/>').appendTo($("body")).css("height",$(document).height()).fadeIn("fast");f.css("z-index",j.css("z-index")+1)}a.dontCenter||f.center().fadeIn("fast",d)},error:function(a){var d=a.responseText||"Unable to load popup - please try again";c.parent().showErrorMessage(d,{"transient":409==a.status})},complete:d.removeSpinner});return c},asyncLoad:function(a){a=$.extend({callback:null,cache:{}},
a);return this.each(function(){var c=$(this),d=c.find(".async-load");c.is(".async-load")&&(d=d.add(c));d.each(function(){var c=$(this),d=c.data("load-url")||"";if(d&&!c.is(":working")){c.working(!0).addSpinner();var e=function(g){c.html(g).removeClass("async-load").mathjax();if((g=c.data("after-load")||"")||a.callback){for(var g=g.split("."),d,h=0;h<g.length;h++)d=(d||window)[g[h]];d=d||a.callback;"function"===typeof d&&d(c)}},k=a.cache[d];k?window.setTimeout(function(){e(k)},0):$.ajax({type:"GET",
url:d,dataType:"html"}).done(function(c){a.cache[d]=c;e(c)}).fail(function(){c.removeSpinner().showErrorMessage("An error has occurred; please try again")})}})})},mathjax:function(){return this.each(function(){"undefined"!=typeof MathJax&&MathJax.Hub.Typeset(this)})},elementNodesOnly:function(){return this.filter(function(){return 1===this.nodeType})},outerHTML:function(){return $("<div>").append(this.eq(0).clone()).html()}})};
StackExchange.helpers=function(){function d(a,c,d){for(var e=0;e<d.length;e++){var f=d[e];try{if(/\*/.test(f))for(var l=0;4>l;l++){var k=f.replace(/\*/g,j[l]),w=a.css(k);c.css(k,w)}else c.css(f,a.css(f))}catch(p){}}}function a(a,c,h,e){if(a.is(":visible")){var f=$.browser.msie?0:0.4;h()?(a.css("opacity",f+(e?0.2:0)),a.addClass("edit-field-overlayed"),h=a.prev(".actual-edit-overlay"),0==h.length&&(e=$.trim(a.parent().find("span.edit-field-overlay").text()),h=a.width(),f=a.height(),h=a.clone().prop("className",
"actual-edit-overlay").attr("name",null).attr("id",null).attr("disabled","disabled").css({position:"absolute",backgroundColor:"white",color:"black","-webkit-text-fill-color":"black",opacity:1,width:h,height:f}),h.is("textarea,input")?(h.val(e),d(c,h,["line-height"])):h.text(e).css("line-height",f+"px").prepend("&nbsp;"),d(c,h,["font-family","font-size","text-align"]),d(a,h,["border-*-style","border-*-color","border-*-width"]),a.css({zIndex:1,position:"relative"}),h.insertBefore(a),e=a.offset().top-
h.offset().top,0!=e&&(c=parseInt(h.css("margin-top")),e=c+e,a.is("textarea")||(e=parseInt(h.prevAll(":visible").eq(0).css("margin-bottom"))+c),h.css("margin-top",e)),a=a.offset().left-h.offset().left,0!=a&&(c=parseInt(h.css("margin-left")),h.css("margin-left",c+a)))):a.css("opacity",1).css("filter","").removeClass("edit-field-overlayed")}}function c(a,c){$(a).find("input[type='submit']").prop("disabled",c)}var e,f,l,j=["left","right","top","bottom"],k={bindMovablePopups:function(){var a=function(){e=
f=null;$("body").removeAttr("style")};$("div.popup").each(function(a,c){var d=$(c).find(".handle");d.length&&(d.css({cursor:"move"}),d.unbind("mousedown").bind("mousedown",function(a){var d=$(c).offset();f={x:d.left-a.pageX,y:d.top-a.pageY};e=$(c);d=e.offset();e.offset(d).offset(d);$("body").attr("style","cursor:move");a.preventDefault()}))});l||(l=!0,$(document).on("mousemove",function(a){e&&e.offset({top:a.pageY+f.y,left:a.pageX+f.x})}).on("keypress",a).on("mouseup",a))},genericBindOverlayEvents:function(c,
d,h){StackExchange.options.isMobile||d.bind("keydown contextmenu",function(){k.hideHelpOverlay(c)}).focus(function(){a(c,d,h,!0)}).on("blur change",function(){a(c,d,h)}).each(function(){a(c,d,h)})},bindHelpOverlayEvents:function(a){a.each(function(){var a=$(this);k.genericBindOverlayEvents(a,a,function(){return""===a.val()})})},hideHelpOverlay:function(a){a.css("opacity",1);a.css("filter","");a.removeClass("edit-field-overlayed")},onClickDraftSave:function(a){$(a).click(function(a){if(null!=StackExchange.cardiologist){a.preventDefault();
var c=this.href;StackExchange.cardiologist.ensureDraftSaved(function(){window.onbeforeunload=null;window.location.href=c});return!1}});return!0},showMessage:function(a,c,d){var e,f,l,j,a=$(a);if(a.length){d=$.extend({},{position:"inside",dismissable:!0,type:"error",closeOthers:!0},d);d.closeOthers&&$(".message").fadeOutAndRemove();var k=$('<div class="message"><div class="message-inner"><div class="message-text"></div></div></div>'),p=k.find(".message-inner"),o=k.find(".message-text");k.addClass("message-"+
d.type);o.html(c);d.dismissable&&(k.addClass("message-dismissable"),o.css("padding-right","35px"),p.prepend($("<div />",{title:"close this message (or hit Esc)","class":"message-close",text:"\u00d7"})),k.click(function(a){$(a.target).is("a")||k.fadeOutAndRemove()}));d.css&&k.css(d.css);"inside"!=d.position&&"inline"!=d.position&&!d.tip&&(d.tip=d.position.my);d.tip&&p.addClass("message-tip message-tip-"+d.tip.replace(" ","-"));if("inline"==d.position)a.append(k);else if("inside"==d.position)k.css("position",
"absolute"),a.append(k);else{k.css("position","absolute");a.offsetParent().append(k);var p=a.position(),o=a.outerWidth(!0),a=a.outerHeight(!0),q=k.outerWidth(),r=k.outerHeight();switch(d.position.at){case "top left":l=0;j=0;break;case "top center":l=0;j=o/2;break;case "top right":l=0;j=o;break;case "right top":l=0;j=o;break;case "right center":l=a/2;j=o;break;case "right bottom":l=a;j=o;break;case "bottom right":l=a;j=o;break;case "bottom center":l=a;j=o/2;break;case "bottom left":l=a;j=0;break;case "left bottom":l=
a;j=0;break;case "left center":l=a/2;j=0;break;case "left top":l=0,j=0}switch(d.position.my){case "left top":e=0;f=-9;break;case "top left":e=-9;f=0;break;case "top right":e=-9;f=q;break;case "right top":e=0;f=q+9;break;case "right bottom":e=r;f=q+9;break;case "bottom right":e=r+9;f=q;break;case "bottom left":e=r+9;f=0;break;case "left bottom":e=r,f=-9}k.css({top:p.top+l-e,left:p.left+j-f})}k.fadeIn();d.transient&&setTimeout(function(){k.fadeOutAndRemove()},Math.max(2500,40*c.length));if(d.removing)k.on("removing",
d.removing);return k}},showErrorMessage:function(a,c,d){d=$.extend({},{position:"inside",type:"error"},d);return this.showMessage(a,c,d)},showErrorPopup:function(a,c,d){return this.showErrorMessage(a,c,d)},showInfoMessage:function(a,c,d){d=$.extend({},{position:"inside","transient":!0,type:"info"},d);return this.showMessage(a,c,d)},removeMessages:function(){$(".message").fadeOutAndRemove()},addSpinner:function(a,c){$(a).append(k.getSpinnerImg(c))},getSpinnerImg:function(a){var c=$("<img />",{"class":"ajax-loader",
src:"/content/img/progress-dots.gif",title:"loading...",alt:"loading..."});a&&c.css(a);return c},removeSpinner:function(){$("img.ajax-loader").remove()},closePopups:function(a){var c=$.Event("closePopups");c.selectorToClose=a;$(document).trigger(c)},enableSubmitButton:function(a){c(a,!1)},disableSubmitButton:function(a){c(a,!0)},loadTicks:function(a){var c;c=a?a.find(".edit-block"):$(".edit-block");0==c.find("input[name=i1l]").length&&!c.data("loading-ticks")&&(c.data("loading-ticks",!0),$.ajax({url:"/questions/ticks",
cache:!1,success:function(a){c.append("<input type='hidden' name='i1l' value='"+a+"' />")},complete:function(){c.data("loading-ticks",!1)}}))},showFancyOverlay:function(a){var a=a||{},c=$("#overlay-header"),d=a.message||"",e=$.browser.msie?{background:"#fff",opacity:0}:{};!1!==a.showClose&&(d+='<br><a class="close-overlay">close this message</a>');c.html(d).css(e).animate({opacity:"1",height:"show"},"slow",a.complete).find(".close-overlay").click(function(){c.animate({opacity:"0",height:"hide"},"fast")})},
DelayedReaction:function(a,c,d){var d=d||{},e,f,l=d.always,j=function(){e=null;a.apply(null,f)};return{trigger:function(){f=arguments;l&&l.apply(null,f);e?d.sliding&&(clearTimeout(e),e=setTimeout(j,c)):e=setTimeout(j,c)},cancel:function(){e&&(clearTimeout(e),e=null)}}},fireAndForget:function(a){$.ajax({type:"POST",url:a,async:!0})}};return k}();
function prepareEditor(d){var a=d.postfix||"",c=function(){setTimeout(function(){StackExchange.editor.initIfShown(d)},1)};if(d.onDemand){for(var e="bold-button,italic-button,spacer1,link-button,quote-button,code-button,image-button,spacer2,olist-button,ulist-button,heading-button,hr-button,spacer3,undo-button,redo-button".split(","),f=$('<ul id="wmd-button-row'+a+'" class="wmd-button-row" />').appendTo(".wmd-button-bar"),l=0,j=0;j<e.length;j++){var k=e[j],g=/spacer/.test(k),k=$("<li id='wmd-"+k+a+
"' />").prop("className","wmd-"+(g?"spacer":"button")).css("left",25*j).appendTo(f);$("<span />").css("background-position",l+"px -20px").appendTo(k);g||(l-=20)}var n=!1;$("#wmd-input, #title, #tagnames, #edit-comment, #m-address, #display-name").one("focus click keydown",function(){n||(n=!0,f.addSpinner({"float":"right"}),StackExchange.using("editor",function(){f.remove();d.autoShowMarkdownHelp&&(d.immediatelyShowMarkdownHelp=!0);c()}))})}else StackExchange.using("editor",c)}
StackExchange.switchMobile=function(d){$.post("/mobile/"+d,{returnurl:window.location.href},function(a){window.location.href=a})};StackExchange.switchLocale=function(d,a){$.post("/locale/"+d,{returnurl:a},function(a){window.location=a})};
jQuery.cookie=function(d,a,c){if("undefined"!=typeof a){c=c||{};null===a&&(a="",c.expires=-1);var e="";if(c.expires&&("number"==typeof c.expires||c.expires.toUTCString))"number"==typeof c.expires?(e=new Date,e.setTime(e.getTime()+864E5*c.expires)):e=c.expires,e="; expires="+e.toUTCString();var f=c.path?"; path="+c.path:"",l=c.domain?"; domain="+c.domain:"",c=c.secure?"; secure":"";document.cookie=[d,"=",encodeURIComponent(a),e,f,l,c].join("")}else{a=null;if(document.cookie&&""!=document.cookie){c=
document.cookie.split(";");for(e=0;e<c.length;e++)if(f=jQuery.trim(c[e]),f.substring(0,d.length+1)==d+"="){a=decodeURIComponent(f.substring(d.length+1));break}}return a}};jQuery.expr[":"].regex=function(d,a,c){var a=c[3].split(","),e=/^(data|css):/,c=a[0].match(e)?a[0].split(":")[0]:"attr",e=a.shift().replace(e,"");return RegExp(a.join("").replace(/^\s+|\s+$/g,""),"ig").test(jQuery(d)[c](e))};
$.extend($.expr[":"],{containsExact:function(d,a,c){return $.trim(d.innerHTML.toLowerCase())===c[3].toLowerCase()},containsExactCase:function(d,a,c){return $.trim(d.innerHTML)===c[3]},containsRegex:function(d,a,c){a=/^\/((?:\\\/|[^\/])+)\/([mig]{0,3})$/.exec(c[3]);return RegExp(a[1],a[2]).test($.trim(d.innerHTML))}});
$.extend({URLEncode:function(d){for(var a="",c=0,d=d.toString(),e=/(^[a-zA-Z0-9_.]*)/;c<d.length;){var f=e.exec(d.substr(c));null!=f&&1<f.length&&""!=f[1]?(a+=f[1],c+=f[1].length):(" "==d[c]?a+="+":(f=d.charCodeAt(c).toString(16),a+="%"+(2>f.length?"0":"")+f.toUpperCase()),c++)}return a},URLDecode:function(d){for(var a,c=/(%[^%]{2})/;null!=(m=c.exec(d))&&1<m.length&&""!=m[1];)b=parseInt(m[1].substr(1),16),a=String.fromCharCode(b),d=d.replace(m[1],a);return d}});
(function(d){d.fn.typeWatch=function(a){function c(a){if("TEXT"==a.type.toUpperCase()||"TEXTAREA"==a.nodeName.toUpperCase()){var c={timer:null,text:d(a).val().toUpperCase(),cb:e.callback,el:a,wait:e.wait};e.highlight&&d(a).focus(function(){this.select()});var j=function(a){var f=c.wait,j=!1;13==a.keyCode&&"TEXT"==this.type.toUpperCase()&&(f=1,j=!0);clearTimeout(c.timer);c.timer=setTimeout(function(){var a=j,f=d(c.el).val();if(f.length>e.captureLength&&f.toUpperCase()!=c.text||a&&f.length>e.captureLength)c.text=
f.toUpperCase(),c.cb(f)},f)};d(a).keydown(j).bind("paste",null,function(a){a.which||j(this)}).bind("input",null,function(a){a.which||j(this)})}}var e=d.extend({wait:750,callback:function(){},highlight:!0,captureLength:2},a);return this.each(function(){c(this)})}})(jQuery);
(function(d){function a(a){var f;return a&&a.constructor==Array&&3==a.length?a:(f=/rgb\(\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*\)/.exec(a))?[parseInt(f[1]),parseInt(f[2]),parseInt(f[3])]:(f=/rgb\(\s*([0-9]+(?:\.[0-9]+)?)\%\s*,\s*([0-9]+(?:\.[0-9]+)?)\%\s*,\s*([0-9]+(?:\.[0-9]+)?)\%\s*\)/.exec(a))?[2.55*parseFloat(f[1]),2.55*parseFloat(f[2]),2.55*parseFloat(f[3])]:(f=/#([a-fA-F0-9]{2})([a-fA-F0-9]{2})([a-fA-F0-9]{2})/.exec(a))?[parseInt(f[1],16),parseInt(f[2],16),parseInt(f[3],16)]:
(f=/#([a-fA-F0-9])([a-fA-F0-9])([a-fA-F0-9])/.exec(a))?[parseInt(f[1]+f[1],16),parseInt(f[2]+f[2],16),parseInt(f[3]+f[3],16)]:/rgba\(0, 0, 0, 0\)/.exec(a)?c.transparent:c[d.trim(a).toLowerCase()]}d.each("backgroundColor,borderBottomColor,borderLeftColor,borderRightColor,borderTopColor,color,outlineColor".split(","),function(c,f){d.fx.step[f]=function(c){if(!c.colorInit){var e;e=c.elem;var k=f,g;do{g=d.curCSS(e,k);if(""!=g&&"transparent"!=g||d.nodeName(e,"body"))break;k="backgroundColor"}while(e=e.parentNode);
e=a(g);c.start=e;c.end=a(c.end);c.colorInit=!0}c.elem.style[f]="rgb("+[Math.max(Math.min(parseInt(c.pos*(c.end[0]-c.start[0])+c.start[0]),255),0),Math.max(Math.min(parseInt(c.pos*(c.end[1]-c.start[1])+c.start[1]),255),0),Math.max(Math.min(parseInt(c.pos*(c.end[2]-c.start[2])+c.start[2]),255),0)].join()+")"}});var c={transparent:[255,255,255]}})(jQuery);
StackExchange.gps=function(){StackExchange._gps_track=[];return{track:function(d,a){var a=a||{},c=null;StackExchange.options&&StackExchange.options.user&&(a.user_type=StackExchange.options.user.userType,c=StackExchange.options.user.ab);var e={evt:d,properties:a,now:(new Date).getTime()};c&&(e.ab=c);StackExchange._gps_track.push(e)}}}();