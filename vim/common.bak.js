
// ***** In house functions not a lib *****//
define([
    'jquery',     // lib/jquery/jquery
    'underscore', // lib/underscore/underscore
    'backbone',    // lib/backbone/backbone
], function($, _, Backbone){
    Bio = {};
	Bio.DT = {};
	Bio.Backbone = {};
	Bio.Mustache = {};
	Bio.am = {};
	Bio.func = {};
	Bio.sort = {};

    Bio.content = '#content';
	Bio.am.chartdiv = 'chartdiv';

	Bio.Backbone.viewMixin = function(from) {
		var to = this.prototype;

		// we add those methods which exists on `from` but not on `to` to the latter
		_.defaults(to, from);
		// … and we do the same for events
		_.defaults(to.events, from.events);

		// we then extend `to`'s `initialize`
		Bio.Backbone.extendMethod(to, from, "initialize");
		// … and its `render`
		Bio.Backbone.extendMethod(to, from, "render");
	};
	// Helper method to extend an already existing method
	Bio.Backbone.extendMethod = function(to, from, methodName) {

		// if the method is defined on from ...
		if (!_.isUndefined(from[methodName])) {
			var old = to[methodName];

			// ... we create a new function on to
			to[methodName] = function() {
				// wherein we first call the method which exists on `to`
				var oldReturn = old.apply(this, arguments);
				// and then call the method on `from`
				from[methodName].apply(this, arguments);

				// and then return the expected result,
				// i.e. what the method on `to` returns
				return oldReturn;
			};
		}
	};

	Bio.Mustache.serve = function (text, render) {
		return (parseFloat(this.size)).toFixed(2) + " " +
				this.unit + " (" + this.weight + " g)";
	};

	Bio.am.color = function (index) {
		var colors = ["#FF0F00", "#FF6600", "#FF9E01", "#FCD202", "#F8FF01", "#B0DE09", "#04D215", "#0D8ECF", "#0D52D1", "#2A0CD0", "#8A0CCF", "#CD0D74"]

		return colors[index + 3];
	}

	// Loops through each category ('vitamins', 'minerals', etc.)
	// then through each array within each category.
	Bio.func.nutrientCategories = function (callBack, context) {
		_.each(context.model.get('nutrientdetails'), function (category, cIndex) {
			_.each(context.model.get(category.toString()), function (arr, index) {
				callBack(context, category, cIndex, arr, index);
			}, context);
		}, context);
	};

	Bio.sort.by = function (name) {
		return function (o, p) {
			var a, b;
			if (typeof o === 'object' && typeof p === 'object' && o && p) {
				a = o[name];
				b = p[name];
				if (a === b) {
					return 0;
				}
				if (typeof a === typeof b) {
					return a < b ? -1 : 1;
				}
				return typeof a < typeof b ? -1 : 1;
			} else {
				throw {
					name: 'Error',
					message: 'Expected an object when sorting by ' + name
				};
			}
		};
	};

	return Bio;
});
