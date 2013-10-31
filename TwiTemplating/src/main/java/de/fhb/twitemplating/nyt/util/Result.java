package de.fhb.twitemplating.nyt.util;

import com.google.gson.annotations.*;

import java.util.*;

public class Result {
	public String section;
	public String title;
	public String published_date;
	public String byline;
	@SerializedName("abstract")
	public String isAbstract;
	public List<Media> media;
    public String url;

	public String getSmallImageURL(){
		if (media != null && !media.isEmpty()) {
			for (Media m : media){
				if (m.metaData.get(0).height < 100){
					return m.metaData.get(0).url;
				}
			}
		}
		return "";
	}
}
