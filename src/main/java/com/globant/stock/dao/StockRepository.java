package com.globant.stock.dao;

//import org.springframework.data.mongodb.repository.MongoRepository;

import com.globant.stock.entity.Stock;
import org.springframework.data.repository.CrudRepository;

public interface StockRepository extends CrudRepository<Stock, String> {

}
