/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package de.fhb.twitemplating.enitiy;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;

/**
 * @author Christoph Ott
 */
@Entity
@Getter
@Setter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
public class NewYorkTimesMessage extends Message {
	private String section;
	private String title;
	private String mediaURL;
}
