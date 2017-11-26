/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.HashMap;

/**
 *
 * @author hlong232
 */
public class CartBean extends HashMap {

    public CartBean() {
        super();
    }

    public boolean removeSPNU(String tensp) {
        if (this.containsKey(tensp)) {
            this.remove(tensp);
            return true;
        }
        return false;
    }
    
    public void plusSP(Sanpham sp) {
        String key = sp.getTenSanPham();
        if (this.containsKey(key)) {
            int oldQuantity = ((Sanpham) this.get(key)).getQuantity();
            ((Sanpham) this.get(key)).setQuantity(oldQuantity + 1);
        } else {
            this.put(sp.getTenSanPham(), sp);
        }
    }
    public boolean minusSP(Sanpham sp) {
        String key = sp.getTenSanPham();
        if (this.containsKey(key)) {
            int oldQuantity = ((Sanpham) this.get(key)).getQuantity();
            if(oldQuantity == 0){
                removeSPNU(key);
                return false;
            }
            ((Sanpham) this.get(key)).setQuantity(oldQuantity - 1);
        } else {
            this.put(sp.getTenSanPham(), sp);
        }
        return true;
    }
}
