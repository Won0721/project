package kr.kh.letsKo.pagination;


import lombok.Data;

@Data
public class Criteria {
	private int page; 		// 현재 페이지 
	private int perPageNum; // 한 페이지에서 컨텐츠 개수 
	private String type; 	// 검색 종류 
	private String search; 	// 검색어
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
		this.type = "all";
		this.search = "";
	} 
	
	public Criteria(int page, int perPageNum) {
		this.page = page;
		this.perPageNum = perPageNum;
		this.type = "all";
		this.search = "";
	}
	
	public int getPageStart() {
		return (page - 1) * perPageNum; 
	}
	
	public String getUrl() { // 현재 페이지에 대한 url 
		return "?type=" + type + "$search=" + search + "&page=" + page;
	}
	
	public String getUrl(int page) {
		return "?type=" + type + "$search=" + search + "&page=" + page;
	}
	

}
