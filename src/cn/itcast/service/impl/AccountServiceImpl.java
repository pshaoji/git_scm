package cn.itcast.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.itcast.dao.AccountMapper;
import cn.itcast.dao.SupplierMapper;
import cn.itcast.entity.Account;
import cn.itcast.entity.Page;
import cn.itcast.entity.Supplier;
import cn.itcast.service.AccountService;
import cn.itcast.service.SupplierService;

@Service("accountService")
public class AccountServiceImpl extends BaseServiceImpl<Account> implements AccountService {
	
	@Override
	public Account login(Account account) {
		// TODO Auto-generated method stub
		return accountMapper.login(account);
	}
}
