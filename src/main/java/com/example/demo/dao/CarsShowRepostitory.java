package com.example.demo.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.bean.Cars;

@Repository("carshowRepository")
public interface CarsShowRepostitory extends CrudRepository<Cars,Integer>{

}
