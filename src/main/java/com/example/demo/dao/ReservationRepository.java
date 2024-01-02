package com.example.demo.dao;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.bean.Reservation;

public interface ReservationRepository extends CrudRepository<Reservation,Integer>{

}
