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

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.Date;

/**
 * @author MacYser
 */
@Entity
@Getter
@Setter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@XmlRootElement
public class Message extends BaseEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private String message;
	private String author;
	private Date published;
	private String URL;
    private String section;
    private String title;
    private String mediaURL;
}
