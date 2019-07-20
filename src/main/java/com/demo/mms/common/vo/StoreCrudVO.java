package com.demo.mms.common.vo;

import com.demo.mms.common.domain.Store;

public class StoreCrudVO {
    private Store oldStore;
    private Store newStore;

    public Store getOldStore() {
        return oldStore;
    }

    public void setOldStore(Store oldStore) {
        this.oldStore = oldStore;
    }

    public Store getNewStore() {
        return newStore;
    }

    public void setNewStore(Store newStore) {
        this.newStore = newStore;
    }
}
