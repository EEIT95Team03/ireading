package org.iii.eeit9503.ireading.controller.book;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.iii.eeit9503.ireading.book.bean.BooksBean;
import org.iii.eeit9503.ireading.book.bean.ReviewBean;
import org.iii.eeit9503.ireading.book.model.BooksService;
import org.iii.eeit9503.ireading.book.model.ReviewService;
import org.iii.eeit9503.ireading.misc.CookieUtils;
import org.iii.eeit9503.ireading.product.bean.ProductBean;
import org.iii.eeit9503.ireading.product.model.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("books")
public class BrowseBookController {
	@Autowired
	private BooksService booksService;
	@Autowired
	private ProductService productService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@RequestMapping(value="/{ISBN}",method={RequestMethod.GET})
	public String getBook(@PathVariable("ISBN") String ISBN,Model model,HttpServletRequest request){
		
		String MemberID=null;
		try {
			MemberID =CookieUtils.findCookie(request, "login_id");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return request.getHeader("referer").substring(30);
		}	
		model.addAttribute("MemberID", MemberID);
		System.out.println(MemberID);
		if(MemberID!=null){
			ReviewBean reviewBean=reviewService.findByMemberIDandISBN(ISBN, MemberID);
			if(reviewBean==null){
				model.addAttribute("review", "0");
			}
			else{
				model.addAttribute("review", "1");
				
				model.addAttribute("MemberReview", reviewBean);}
		}
		
		BooksBean book=booksService.findByID(ISBN);
		model.addAttribute("book", book);
		List<ReviewBean> reviewList=reviewService.findByISBN(ISBN);
		model.addAttribute("reviews", reviewList);
		List<ProductBean> productList=productService.findByISBN(ISBN);
		model.addAttribute("products", productList);
		

		model.addAttribute("count", booksService.getSellBookByISBN(ISBN));
		return "browse.book";
				
	}

}
