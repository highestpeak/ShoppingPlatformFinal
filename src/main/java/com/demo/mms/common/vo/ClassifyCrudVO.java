package com.demo.mms.common.vo;

import com.demo.mms.common.domain.GoodsClassify;
import com.demo.mms.common.domain.Store;

import java.util.List;

public class ClassifyCrudVO {
    private Store store;
    private List<GoodsClassify> classifiesToDel;

    private List<GoodsClassify> classifiesToAdd;

    private GoodsClassify oldGoodsClassify;
    private GoodsClassify newGoodsClassify;

    public GoodsClassify getOldGoodsClassify() {
        return oldGoodsClassify;
    }

    public void setOldGoodsClassify(GoodsClassify oldGoodsClassify) {
        this.oldGoodsClassify = oldGoodsClassify;
    }

    public GoodsClassify getNewGoodsClassify() {
        return newGoodsClassify;
    }

    public void setNewGoodsClassify(GoodsClassify newGoodsClassify) {
        this.newGoodsClassify = newGoodsClassify;
    }

    public Store getStore() {
        return store;
    }

    public void setStore(Store store) {
        this.store = store;
    }

    public List<GoodsClassify> getClassifiesToDel() {
        return classifiesToDel;
    }

    public void setClassifiesToDel(List<GoodsClassify> classifiesToDel) {
        this.classifiesToDel = classifiesToDel;
    }

    public List<GoodsClassify> getClassifiesToAdd() {
        return classifiesToAdd;
    }

    public void setClassifiesToAdd(List<GoodsClassify> classifiesToAdd) {
        this.classifiesToAdd = classifiesToAdd;
    }
}
