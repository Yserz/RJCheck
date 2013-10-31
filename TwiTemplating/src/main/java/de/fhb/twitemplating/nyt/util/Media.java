package de.fhb.twitemplating.nyt.util;


import com.google.gson.annotations.*;

import java.util.*;

public class Media {
	public String type;
	public String subtype;
	@SerializedName("media-metadata")
	public List<MediaMetaData> metaData;
}
