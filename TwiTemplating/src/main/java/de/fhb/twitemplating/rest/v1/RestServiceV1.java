/*
 * Copyright (C) 2013 Michael Koppen
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package de.fhb.twitemplating.rest.v1;

import de.fhb.twitemplating.enitiy.Message;
import de.fhb.twitemplating.nyt.service.NewYorkTimesLocal;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import java.util.List;
import java.util.logging.Logger;

/**
 *
 * @author Michael Koppen <michael.koppen@googlemail.com>
 */
@Path("/v1/service")
@Stateless
public class RestServiceV1 {

	private static final Logger LOG = Logger.getLogger(RestServiceV1.class.getName());
    private final String jsonMediaType = "application/json;charset=utf-8";

    @EJB
    private NewYorkTimesLocal nyt;

	@GET
	@Path("ping")
	public String ping() {
		return "alive";
	}

    @GET
    @Path("messages")
    @Produces(jsonMediaType)
    public List<Message> getMessages(){
        return nyt.getMessages();
    }
}
