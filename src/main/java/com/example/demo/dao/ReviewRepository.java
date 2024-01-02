package com.example.demo.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.bean.Reviews;

@Repository("reviewsRepository")
public interface ReviewRepository extends CrudRepository<Reviews, Integer>{

	
}
