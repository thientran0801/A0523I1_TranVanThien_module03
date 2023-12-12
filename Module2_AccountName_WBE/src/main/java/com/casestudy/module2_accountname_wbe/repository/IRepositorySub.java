package com.casestudy.module2_accountname_wbe.repository;

import java.util.List;

public interface IRepositorySub <E> {
    List<E> showList();
    E findById(int id);
}
