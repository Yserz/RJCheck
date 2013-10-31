/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package de.fhb.twitemplating.nyt.service;

import de.fhb.twitemplating.enitiy.*;

import javax.ejb.*;
import java.util.*;

/**
 * @author Christoph Ott
 */
@Local
public interface NewYorkTimesLocal {

	void start();

	void stop();

	List<Message> getMessages();

}
