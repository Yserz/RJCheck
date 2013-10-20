"use strict";

TT.Renderer = (function() {
	var Renderer = {};


	/* Loading Pages */
	TT.require("resources/system/vendor/handlebars.js");

	// init Handlebars-templates
	Renderer.requireTemplate = function(template) {
		return $.ajax({
			type: "GET",
			url: template,
			async: false
		});
	};

	Handlebars._ifLevel = 0;
	Handlebars._partialsApplied = {};

	Handlebars.loadPartial = function loadPartial(name, data) {
		var partial = Handlebars.partials[name];

		if (typeof partial === "string") {
			partial = Handlebars.compile(partial);
			Handlebars.partials[name] = partial;
		}

		if (typeof partial === 'undefined') {
			partial = data;
		}

		if (typeof partial === 'function') {
			Handlebars.registerPartial(name, data);
		}

		return partial;
	};

	Handlebars.registerHelper("block", function(name, options) {
		var partial = Handlebars.loadPartial(name, options.fn);
		return partial(this, {data: options.hash});
	});


	Handlebars.registerHelper("partial", function(name, options) {
		if (!Handlebars._partialsApplied[name]) {
			Handlebars.registerPartial(name, options.fn);
			Handlebars._partialsApplied[name] = true;
		}
	});

	Handlebars.registerHelper("inheritsFrom", function(options) {
		Handlebars._ifLevel++;

		var content = options.fn(this);

		Handlebars._ifLevel--;
		if (Handlebars._ifLevel === 0) {
			Handlebars._partialsApplied = {};
		}

		return content;
	});
	if (TT.debug) {
		console.log("TT: ", "Renderer: ", "start compiling templates");
	}
	Renderer.basehead = Handlebars.compile(Renderer.requireTemplate("resources/pages/templates/basehead.html").responseText);
	Renderer.basebody = Handlebars.compile(Renderer.requireTemplate("resources/pages/templates/basebody.html").responseText);

	Handlebars.registerPartial("basebody", Renderer.basebody);
	Handlebars.registerPartial("basehead", Renderer.basehead);

	return Renderer;
}());