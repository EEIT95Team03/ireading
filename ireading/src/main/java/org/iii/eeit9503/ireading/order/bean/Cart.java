package org.iii.eeit9503.ireading.order.bean;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.iii.eeit9503.ireading.product.bean.ProductBean;
import org.iii.eeit9503.ireading.product.model.ProductService;


public class Cart {
	
    private static final long serialVersionUID = 1L;
    private final int shpingTarget =300;
    private final int basefreight =60;
    //private static Logger logger = Logger.getLogger(Cart.class);  
    private List<CartItem> items = new ArrayList<CartItem>();  
    private HttpServletRequest request;  
    private int sumamount;//总计金额  
    private int freight;
    private int sumtotal;
    private int sumnumb;//总计数量        
    public Cart() {  
    }  
      
    //增加  
    public int addItem(CartItem item) {  
        if (items.contains(item)) {// 如果购物项已经存在于购物车,累加其购买数量  
            for (CartItem cItem : items) {  
                if (cItem.equals(item)) {
                    return 0;  
                }  
            }  
        } else {
            items.add(item);  
        }  
        //计算总价  
        sumamount = this.getsumamount();  
        sumnumb = this.getsumnumb();  
        return 1; 
    }  
      
    //删除  
    public void deleteItem(CartItem item) {  
        if (items.contains(item)){  
            items.remove(item);  
        }  
        //计算总价  
        sumamount = this.getsumamount();  
        sumnumb = this.getsumnumb();  
    }  
      
    //总价  
    public int getsumamount(){  
        int result = 0;  
        for(CartItem cItem: items){  
            result = result + cItem.getProductBean().getProductPrice();  
        }  
        return result;  
    }  
      
    //总数量  
    public int getsumnumb(){  
        int result = 0;  
        for(CartItem cItem: items){  
            result ++;  
        }  
        return result;  
    }  
      
    /** 
     * 序列化 
     * @return 
     * @throws UnsupportedEncodingException 
     */  
    public String serialize() throws UnsupportedEncodingException {  
        StringBuilder buffer = new StringBuilder();  
        for(int i = 0;i<items.size();i++){  
            String item = items.get(i).toString();            
            buffer.append(item);  
            buffer.append(";");  
        }  
        if (buffer.length() > 0)  
            buffer.deleteCharAt(buffer.length() - 1); 
        System.out.println(buffer.toString());
        return buffer.toString();  
    }  
      
    /** 
     * 加载购物车 
     * @param productService 
     * @param ticketService 
     * @param content 
     * @throws UnsupportedEncodingException 
     */  
    public void load(ProductService productService, String content) throws UnsupportedEncodingException {  
        items.clear();  
        if (content == null || "".equals(content))  
            return;  
        else {  
            try { 
                String[] itemsArry = content.split(";");  
                int sumnumb = 0;//总数量  
                int sumamount = 0;//总计  
                int sumtotal = 0;
                for (int i = 0; i < itemsArry.length; i++) {  
                    String array = itemsArry[i];  
                    String[] strarray = array.split(",");  
                    String id = strarray[0].split(":")[1]; 
                   
                    //int id = Integer.parseInt(strarray[1].split(":")[1]);  
                    //double price = Double.parseDouble(strarray[2].split(":")[1]);  
                    CartItem item = new CartItem();
                   
                    ProductBean bean=productService.findByPrimaryKey(id);
                    item.setProductBean(bean);
                    items.add(item);  
                      
                    sumnumb ++;  
                    sumamount = sumamount+bean.getProductPrice();  
                }  
                this.setSumamount(sumamount);
                this.setSumtotal(sumamount);
                
            } catch (Exception e) {  
                // TODO: handle exception
            	e.printStackTrace();
                return;  
            }  
        }  
    }  
  
    private void setSumamount(int sumamount) {
		// TODO Auto-generated method stub
    	this.sumamount=sumamount;
		
	}

	//删除所有  
    public void deleteAll() {  
        items.clear();  
    }

	public List<CartItem> getItems() {
		return items;
	}

	public int getSumtotal() {
		return sumtotal;
	}

	public void setSumtotal(int sumtotal) {
		if(sumtotal>=shpingTarget){
			setfreight(0);
		this.sumtotal = sumtotal;}
		else{setfreight(basefreight);
			this.sumtotal = sumtotal+this.freight;
		}
	}

	public int getShpingTarget() {
		return shpingTarget;
	}

	public int getfreight() {
		return freight;
	}

	public void setfreight(int freight) {
		this.freight = freight;
	}

	public int getBasefreight() {
		return basefreight;
	}


	
  
}  