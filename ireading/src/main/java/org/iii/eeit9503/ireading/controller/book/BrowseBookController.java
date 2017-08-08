package org.iii.eeit9503.ireading.controller.book;

import java.util.List;

import org.iii.eeit9503.ireading.book.bean.BooksBean;
import org.iii.eeit9503.ireading.book.bean.ReviewBean;
import org.iii.eeit9503.ireading.book.model.BooksService;
import org.iii.eeit9503.ireading.book.model.ReviewService;
import org.iii.eeit9503.ireading.product.bean.ProductBean;
import org.iii.eeit9503.ireading.product.model.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
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
	
	@RequestMapping(value="/{ISBN}",method={RequestMethod.GET})
	public String getBook(@PathVariable("ISBN") String ISBN,Model model){
		BooksBean book=booksService.findByID(ISBN);
		model.addAttribute("book", book);
		List<ReviewBean> reviewList=reviewService.findByISBN(ISBN);
		model.addAttribute("reviews", reviewList);
		List<ProductBean> productList=productService.findByISBN(ISBN);
		model.addAttribute("products", productList);
		return "browse.book";
				
	}

}
