/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package de.fhb.twitemplating.enitiy;

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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;

        Message message1 = (Message) o;

        if (URL != null ? !URL.equals(message1.URL) : message1.URL != null) return false;
        if (author != null ? !author.equals(message1.author) : message1.author != null) return false;
        if (id != null ? !id.equals(message1.id) : message1.id != null) return false;
        if (mediaURL != null ? !mediaURL.equals(message1.mediaURL) : message1.mediaURL != null) return false;
        if (message != null ? !message.equals(message1.message) : message1.message != null) return false;
        if (published != null ? !published.equals(message1.published) : message1.published != null) return false;
        if (section != null ? !section.equals(message1.section) : message1.section != null) return false;
        if (title != null ? !title.equals(message1.title) : message1.title != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = super.hashCode();
        result = 31 * result + (id != null ? id.hashCode() : 0);
        result = 31 * result + (message != null ? message.hashCode() : 0);
        result = 31 * result + (author != null ? author.hashCode() : 0);
        result = 31 * result + (published != null ? published.hashCode() : 0);
        result = 31 * result + (URL != null ? URL.hashCode() : 0);
        result = 31 * result + (section != null ? section.hashCode() : 0);
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (mediaURL != null ? mediaURL.hashCode() : 0);
        return result;
    }

    public Message() {

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Date getPublished() {
        return published;
    }

    public void setPublished(Date published) {
        this.published = published;
    }

    public String getURL() {
        return URL;
    }

    public void setURL(String URL) {
        this.URL = URL;
    }

    public String getSection() {
        return section;
    }

    public void setSection(String section) {
        this.section = section;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getMediaURL() {
        return mediaURL;
    }

    public void setMediaURL(String mediaURL) {
        this.mediaURL = mediaURL;
    }
}
