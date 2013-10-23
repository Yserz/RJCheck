"use strict";



var TT = TT || {};
(function() {
    TT.debug = true;

    if (TT.debug) {
        console.log("TT: ", "Initialize TwiTemplating!");
    }

    TT.loadedScripts;

    /*
     * This function loads js-files.
     * For this function jQuery is needed.
     */
    TT.require = function(script) {
        if (TT.loadedScripts === undefined) {
            TT.loadedScripts = new Array();
        }
        // load scripts only once
        if (TT.loadedScripts.indexOf(script) < 0) {
            $.ajax({
                url: script,
                dataType: "script",
//			cache: true,
                async: false, // scripts are neccessary *before* start executing them
                success: function() {
                    if (TT.debug) {
                        console.log("TT: ", "Loaded Script: " + script);
                    }
                    TT.loadedScripts.push(script);
                },
                error: function() {
                    throw new Error("TT: Could not load script " + script);
                }
            });
        }
    };

    /* import vendor scripts */
    TT.require("resources/system/vendor/bootstrap.min.js");
    TT.require("resources/system/vendor/highlight.js/highlight.pack.js");
    /* import OwnBlog scripts */
    TT.require("resources/system/TwiTemplatingWebservice.js");
    TT.require("resources/system/TwiTemplatingRenderer.js");

    // init Highlighting
    hljs.initHighlightingOnLoad();

    if (TT.debug) {
        // say hello to the world!
        console.log("TT: ", "Welcome to your TwiTemplating!");
    }
//	TT.Webservice.createBlog();
//	console.log(TT.Webservice.getBlog(1));
})();
