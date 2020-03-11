package org.ji.vo;	
			//검색타입, 검색어 쓰려고 만듦
public class SearchCriteria extends Criteria {
							//Criteria를 extends했기 때문에 Criteria기능 사용 가능
	private String searchType = "";
	private String keyword = "";
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + "]";
	}
	
}
