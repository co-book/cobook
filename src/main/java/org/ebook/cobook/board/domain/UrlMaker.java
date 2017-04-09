package org.ebook.cobook.board.domain;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class UrlMaker {

	@Value("#{url.review}")
	private String review;

	@Value("#{url.reviewList}")
	private String reviewList;

	@Value("#{url.reviewSingle}")
	private String reviewSingle;

	@Value("#{url.mybook}")
	private String mybook;

	@Value("#{url.mybookList}")
	private String mybookList;

	@Value("#{url.mybookSingle}")
	private String mybookSingle;

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public String getReviewList() {
		return reviewList;
	}

	public void setReviewList(String reviewList) {
		this.reviewList = reviewList;
	}

	public String getReviewSingle() {
		return reviewSingle;
	}

	public void setReviewSingle(String reviewSingle) {
		this.reviewSingle = reviewSingle;
	}

	public String getMybook() {
		return mybook;
	}

	public void setMybook(String mybook) {
		this.mybook = mybook;
	}

	public String getMybookList() {
		return mybookList;
	}

	public void setMybookList(String mybookList) {
		this.mybookList = mybookList;
	}

	public String getMybookSingle() {
		return mybookSingle;
	}

	public void setMybookSingle(String mybookSingle) {
		this.mybookSingle = mybookSingle;
	}

	public String reviewMakeQuery(int review_no){
		
		UriComponents uriComponents =
	            UriComponentsBuilder.newInstance()
	            .queryParam("review_no", review_no)
	            .build();	            
		
		return uriComponents.toUriString();
	}

}
