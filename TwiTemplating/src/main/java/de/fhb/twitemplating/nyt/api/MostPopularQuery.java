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

import java.util.ArrayList;
import java.util.List;

public final class MostPopularQuery {

  static String VERSION_TWO = "v2";
  static String ALL_SECTIONS = "all-sections";
  ResourceType resourceType;
  TimePeriod timePeriod;
  List<String> sections;
  int offset;
  ResponseFormat responseFormat = ResponseFormat.JSON;
  List<ShareType> shareTypes;
  String version;

  public MostPopularQuery(ResourceType resourceType, String section, TimePeriod timePeriod) {
    this.resourceType = resourceType;
    sections = new ArrayList<String>();
    sections.add(section);
    this.timePeriod = timePeriod;
    shareTypes = new ArrayList<ShareType>();
    version = VERSION_TWO;
  }

  public MostPopularQuery(ResourceType resourceType, TimePeriod timePeriod) {
    this(resourceType, ALL_SECTIONS, timePeriod);
  }

  public void addShareType(ShareType shareType) {
    shareTypes.add(shareType);
  }

  public void addShareTypes(List<ShareType> shareTypes) {
    shareTypes.addAll(shareTypes);
  }

  public void setOffset(int offset) {
    if (offset % 20 != 0) {
      offset = (int) Math.floor(offset / 20) * Math.round((offset % 20) * 20);
    } else {
      this.offset = offset;
    }
  }

  public void setVersion(String version) {
    this.version = version;
  }

  public void setResponseFormat(ResponseFormat responseFormat) {
    this.responseFormat = responseFormat;
  }

  public TimePeriod getTimePeriod() {
    return timePeriod;
  }

  public ResourceType getResourceType() {
    return resourceType;
  }

  public List<String> getSections() {
    List<String> s = new ArrayList<String>();
    s.addAll(sections);
    return s;
  }

  public java.util.List<ShareType> getShareTypes() {
    java.util.List<ShareType> st = new ArrayList<de.fhb.twitemplating.nyt.api.ShareType>();
    st.addAll(shareTypes);
    return st;
  }

  public ResponseFormat getResponseFormat() {
    return responseFormat;
  }

  public int getOffset() {
    return offset;
  }

  public String getVersion() {
    return version;
  }

}
