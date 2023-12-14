package com.casestudy.module2_accountname_wbe.repository;

import java.util.List;

public interface IRepositoy <E>{
    List<E> showList();
    void add(E e);
    void edit(E e);
    void delete(int id);
    E findById(int id);
}
