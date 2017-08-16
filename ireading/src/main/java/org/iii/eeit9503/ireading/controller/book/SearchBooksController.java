package org.iii.eeit9503.ireading.controller.book;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.iii.eeit9503.ireading.book.bean.BooksBean;
import org.iii.eeit9503.ireading.book.bean.ReviewBean;
import org.iii.eeit9503.ireading.book.model.BooksService;
import org.iii.eeit9503.ireading.book.model.ReviewService;
import org.iii.eeit9503.ireading.product.bean.ProductBean;
import org.iii.eeit9503.ireading.product.model.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/searchBooks.controller")
public class SearchBooksController {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private BooksService booksService;
	@Autowired
	private ProductService productService;
	@Autowired
	private ReviewService reviewService;
	
	
	
	@RequestMapping(value="/searchBooksList",method=RequestMethod.GET)
	public String searchBooksList(BooksBean bean,Model model , @RequestParam Map<String,Object> param){
//		System.out.println("param:" + param);
		
		//陣列轉字串                                                             //search = 對應輸入框的name="search"
		String searchName = MapUtils.getString(param, "search");
//		System.out.println("searchName:" + searchName);
		String books =null;
		if(searchName.trim().length()!=0){
			String[] str=searchName.split(" ");
			if(str.length>1){
				 books = "Select * FROM Books Where ";
			for(int i=0;i<str.length;i++){
				if(i==0){books=books+" (Title LIKE '%" + str[i] + "%' or Author LIKE '%" + str[i] + "%') ";}
				else{books=books+" and (Title LIKE '%" + str[i] + "%' or Author LIKE '%" + str[i] + "%') ";}	
			}
			
			}
			else{
				 books = "Select * FROM Books Where Title LIKE '%" + searchName + "%' or Author LIKE '%" + searchName + "%'";	
			}

		List<Map<String,Object>> booksdataList = jdbcTemplate.queryForList(books.toString());
		int index=0;
		for(Map<String,Object> map:booksdataList)
		{ BooksBean bbean=booksService.findByID((String)map.get("ISBN"));
		booksdataList.get(index).put("Cover",bbean);
		
		Object count=booksService.getSellBookByISBN((String)map.get("ISBN"));		
		booksdataList.get(index).put("Count",count);
		
		index++;
		}
		model.addAttribute("booksdataList", booksdataList);
		model.addAttribute("selectCount", index);
		}
		else{
			books = "Select * FROM Books";

			List<Map<String,Object>> booksdataList = jdbcTemplate.queryForList(books.toString());
			int index=0;
			for(Map<String,Object> map:booksdataList)
			{ BooksBean bbean=booksService.findByID((String)map.get("ISBN"));
			booksdataList.get(index).put("Cover",bbean);
			
			Object count=booksService.getSellBookByISBN((String)map.get("ISBN"));		
			booksdataList.get(index).put("Count",count);
			
			index++;
			}
//			System.out.println("dataList:" + dataList);
			model.addAttribute("booksdataList", booksdataList);
			model.addAttribute("selectCount", index);
//			List<BooksBean> list = booksService.select(bean);
//			model.addAttribute("dataLs", list);
		}

		return "SearchBooks.list";
		
	}
	
	@RequestMapping(value="/{ISBN}",method={RequestMethod.GET})
	public String getBook(@PathVariable("ISBN") String ISBN,Model model){
		
		BooksBean bean = new BooksBean();
		bean.setISBN(ISBN);
		
		List<BooksBean> book = booksService.select(bean);
		model.addAttribute("book", book.get(0));
		
		BooksBean updateClick=book.get(0);
		updateClick.setClick(updateClick.getClick()+1);
		booksService.update(updateClick);
		
		JdbcTemplate jdbcTemplate = new JdbcTemplate();
				
//		BooksBean book=booksService.findByID(ISBN);
//		model.addAttribute("book", book);
		
		List<ReviewBean> reviewList=reviewService.findByISBN(ISBN);
		model.addAttribute("reviews", reviewList);
		
		List<ProductBean> productList=productService.findByISBN(ISBN);
		model.addAttribute("products", productList);
		
		return "SearchBooks.singleBook";
				
	}
	
	@RequestMapping(value="/advanceSearch",method=RequestMethod.GET)
	public String advanceSearch(BooksBean bean,Model model , @RequestParam Map<String,Object> param){
		System.out.println("param="+param);
		
		
		String ISBN = MapUtils.getString(param, "ISBN");
		String Title = MapUtils.getString(param, "Title");
		String CategoryID = MapUtils.getString(param, "CategoryID");
		String Author = MapUtils.getString(param, "Author");
		String Publisher = MapUtils.getString(param, "Publisher");
		
		String sqltext = null;
		
		if(ISBN.trim().length()==0 && Title.trim().length()==0 && CategoryID.trim().length()==0 && Author.trim().length()==0 && Publisher.trim().length()==0){
			sqltext = "select * from books ";
			
		}else{
			sqltext = "select * from books "
					+ "where (Title like '%"+Title+"%' OR Title is null) "
					+ "AND (CategoryID like '%"+CategoryID+"%' OR CategoryID is null)"
					+ "AND (Author like '%"+Author+"%' OR Author is null)"
					+ "AND (Publisher like '%"+Publisher+"%' OR Publisher is null)"
					+ "AND (ISBN like '%"+ISBN+"%' OR ISBN is null)";
		}
		
		
		
		
				
				
		
		List<Map<String,Object>> booksdataList = jdbcTemplate.queryForList(sqltext.toString());
		int index=0;
		for(Map<String,Object> map:booksdataList)
		{ BooksBean bbean=booksService.findByID((String)map.get("ISBN"));
		booksdataList.get(index).put("Cover",bbean);
		
		Object count=booksService.getSellBookByISBN((String)map.get("ISBN"));		
		booksdataList.get(index).put("Count",count);
		
		index++;
		}
		model.addAttribute("booksdataList", booksdataList);
		model.addAttribute("selectCount", index);
		System.out.println("booksdataList:"+booksdataList);
		
		return "SearchBooks.list";
		
	}
	
}
