package org.iii.eeit9503.ireading.order.bean;

import org.iii.eeit9503.ireading.product.bean.ProductBean;

/** 
 * 购物车-一项 
 * @author shiaj 
 * Dec,2012 
 */  
@SuppressWarnings("serial")  
public class CartItem implements java.io.Serializable{
    private ProductBean productBean;//商品实体类  
  
    public CartItem(){}  
      
    public CartItem(ProductBean productBean) {  
        this.productBean = productBean;
    }  
     
    
    public ProductBean getProductBean() {
		return productBean;
	}

	public void setProductBean(ProductBean productBean) {
		this.productBean = productBean;
	}
  
    @Override  
    public int hashCode() {  
        final int prime = 31;  
        int result = 1;  
        result = prime * result + ((productBean == null) ? 0 : productBean.hashCode());  
        return result;  
    }  
      
    @Override  
        public boolean equals(Object obj) {  
        if (this == obj)  
            return true;  
        if (obj == null)  
            return false;  
        if (getClass() != obj.getClass())  
            return false;  
        CartItem other = (CartItem) obj;  
        if(this.productBean.getProductID().equals(other.getProductBean().getProductID())){  
            return true;  
        }  
        return false;  
    }  
      
    public String toString(){  
        StringBuffer string = new StringBuffer();  
        string.append("id:" + this.productBean.getProductID() +   
                ",price:" + this.productBean.getProductPrice());  
        return string.toString();  
    }  
  
}  