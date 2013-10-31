// Copyright 2012 Chris Downes. 
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// //////////////////////////////////////////////////////////////////////////////
package de.fhb.twitemplating.nyt.api;

import java.net.MalformedURLException;

/**
 * http://api.nytimes.com/svc/mostpopular/{version}/{resource-type}/{section}[/
 * share-types]/{time- period}[.response-format]?api-key={your-API-key}
 *
 * @author Chris Downes
 */
public class MostPopularSearch {

	NYTAPIKey key;
	MostPopularQuery query;
	private String BASE_URI = "http://api.nytimes.com/svc/mostpopular/";

	public MostPopularSearch(NYTAPIKey key) {
		this.key = key;
	}

	/**
	 * @param query
	 * @return a json
	 */
	public String search(MostPopularQuery query) {
		this.query = query;
		StringBuilder queryURL = new StringBuilder();
		queryURL.append(BASE_URI);
		queryURL.append(query.getVersion());
		queryURL.append("/" + query.getResourceType().toString());
		queryURL.append("/all-sections");
		queryURL.append("/" + query.getTimePeriod().toString());
		queryURL.append("/" + "?api-key=" + key.getKey());
		try {
			String jsonOutput = HttpRequest.request(new java.net.URL(queryURL.toString()));
			jsonOutput = jsonOutput.replace("media\":\"\"", "media\":[]");
			return jsonOutput;
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
		return null;

	}
}
