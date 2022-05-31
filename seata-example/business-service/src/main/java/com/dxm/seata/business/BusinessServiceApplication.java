package com.dxm.seata.business;

import com.dxm.seata.business.client.OrderClient;
import com.dxm.seata.business.client.StorageClient;
import io.seata.spring.annotation.GlobalTransactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
@EnableFeignClients
@EnableDiscoveryClient
public class BusinessServiceApplication {

    @Autowired
    private OrderClient orderClient;
    @Autowired
    private StorageClient storageClient;

    @GetMapping("buy")
    @GlobalTransactional
    public String buy(Long userId, Long productId, @RequestParam(defaultValue = "false") Boolean error) {
        orderClient.create(userId, productId);
        if (error) {
            throw new RuntimeException("模拟异常");
        }
        storageClient.changeStorage(productId, 1);
        return "ok";
    }

    public static void main(String[] args) {
        SpringApplication.run(BusinessServiceApplication.class, args);
    }

}
