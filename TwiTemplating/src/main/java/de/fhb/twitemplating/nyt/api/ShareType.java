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

public enum ShareType {

  DIGG("digg"), EMAIL("email"), FACEBOOK("facebook"), MIXX("mixx"), MYSPACE("myspace"), PERMALINK(
      "permalink"), TIMESPEOPLE("timespeople"), TWITTER("twitter"), YAHOOBUZZ("yahoobuzz");

  String name;

  ShareType(String name) {
    this.name = name;
  }

  public String toString() {
    return name;
  }

}
