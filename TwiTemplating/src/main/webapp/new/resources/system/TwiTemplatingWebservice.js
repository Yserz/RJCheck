"use strict";
/*
 * This class connects to the OwnBlog REST-API.
 */

TT.Webservice = (function() {
    var Webservice = {};

    Webservice.TT_WEBSERVICE_ADDRESS = "http://localhost:8080/";


    Webservice.ping = function() {
        return $.ajax({
            type: "GET",
            dataType: "text",
            url: Webservice.TT_WEBSERVICE_ADDRESS + "TwiTemplating/rest/v1/service/ping",
            async: false,
            complete: function(jqXHR, textStatus) {
                switch (jqXHR.status) {
                    case 404:
                        console.log(jqXHR);
                        throw new Error("Resource Not Found: " + jqXHR.responseText);
                    case 500:
                        console.log(jqXHR);
                        throw new Error("Internal Server Error: " + jqXHR.responseJSON.errorMsg);
                    default:
                        console.log(jqXHR.responseText);
                }
            }
        });
    };

    Webservice.messages = function() {
        return $.ajax({
            type: "GET",
            dataType: "json",
            contentType: "application/json;charset=utf-8",
            url: Webservice.TT_WEBSERVICE_ADDRESS + "TwiTemplating/rest/v1/service/messages",
            cache: true,
            async: false,
            complete: function(jqXHR, textStatus) {
                switch (jqXHR.status) {
                    case 404:
                        console.log(jqXHR);
                        throw new Error("Resource Not Found: " + jqXHR.responseText);
                    case 500:
                        console.log(jqXHR);
                        throw new Error("Internal Server Error: " + jqXHR.responseJSON.errorMsg);
                    default:
                        console.log(jqXHR.responseJSON);
                }
            }
        });
    };
    return Webservice;
}());
