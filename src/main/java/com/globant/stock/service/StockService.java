package com.globant.stock.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.globant.stock.dao.StockRepository;
import com.globant.stock.entity.Stock;
import org.springframework.web.bind.annotation.ResponseBody;

@Service
public class StockService {

    @Autowired
    private StockRepository stockRepository;

    public Iterable<Stock> getAllStock() {
        return stockRepository.findAll();
    }

    //@ResponseBody
    public Stock saveStock(Stock stock)
    {
        stock.setNow(new Date());
        stock.setTotalValue(stock.getNumOfStock()*stock.getStockPrice());
        return stockRepository.save(stock);
    }
}