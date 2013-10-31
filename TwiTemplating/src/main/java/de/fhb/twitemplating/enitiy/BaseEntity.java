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
package de.fhb.twitemplating.enitiy;

import javax.persistence.EntityListeners;
import javax.persistence.MappedSuperclass;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import java.io.Serializable;
import java.util.Date;

/**
 * This is a MappedSuperclass for all Enitities in this system. Every Entity who inherits from this class will have the
 * ability to save the date of creation and the date of the last modfication of its own. This works over an
 * {@link EntityListener}. In Addition the Serializable interface is implemented here.
 *
 * @author Michael Koppen <michael.koppen@googlemail.com>
 */
@MappedSuperclass
@EntityListeners(EntityListener.class)
@XmlRootElement

public class BaseEntity implements Serializable {

  private static final long serialVersionUID = 1L;
  @Temporal(value = TemporalType.TIMESTAMP)
  private Date created;
  @Temporal(value = TemporalType.TIMESTAMP)
  private Date lastModified;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        BaseEntity that = (BaseEntity) o;

        if (!created.equals(that.created)) return false;
        if (!lastModified.equals(that.lastModified)) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = created.hashCode();
        result = 31 * result + lastModified.hashCode();
        return result;
    }

    public BaseEntity() {

    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Date getLastModified() {
        return lastModified;
    }

    public void setLastModified(Date lastModified) {
        this.lastModified = lastModified;
    }
}
