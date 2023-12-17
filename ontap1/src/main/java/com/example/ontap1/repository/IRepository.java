package com.example.ontap1.repository;

import java.util.List;

public interface IRepository<E> {
    List<E> showList();
    boolean add(E e);
    boolean delete(E e);
    boolean update(E e);
}
