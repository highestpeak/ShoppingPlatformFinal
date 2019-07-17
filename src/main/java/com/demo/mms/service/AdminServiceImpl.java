package com.demo.mms.service;

import com.demo.mms.dao.AdminMapper;
import com.demo.mms.common.domain.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    AdminMapper adminMapper;
    @Transactional
    public void addAdmin(Admin admin) {
        adminMapper.insert(admin);
    }
}
