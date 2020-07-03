package com.suyh.filter;

import com.google.common.util.concurrent.RateLimiter;
import com.netflix.zuul.ZuulFilter;
import com.netflix.zuul.context.RequestContext;
import com.netflix.zuul.exception.ZuulException;
import org.springframework.cloud.netflix.zuul.filters.support.FilterConstants;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;

/**
 * 订单限流
 * 详细说话可以查看 LoinFilter 的注释
 * google guava 框架
 */
@Component
public class OrderRateLimiterFilter extends ZuulFilter {

    // 每秒产生1000 个令牌
    private static final RateLimiter RATE_LIMITER = RateLimiter.create(1000);

    @Override
    public String filterType() {
        return FilterConstants.PRE_TYPE;
    }

    @Override
    public int filterOrder() {
        return -4;
    }

    @Override
    public boolean shouldFilter() {
        RequestContext requestContext = RequestContext.getCurrentContext();
        HttpServletRequest request = requestContext.getRequest();

        // 只对订单接口限流
        if ("/apigateway/order/api/v1/order/save".equalsIgnoreCase(request.getRequestURI())) {
            return true;
        }

        return false;
    }

    @Override
    public Object run() throws ZuulException {
        RequestContext requestContext = RequestContext.getCurrentContext();

        // 获取一个令牌
        boolean b = RATE_LIMITER.tryAcquire();
        if (!b) {
            // 未能获取到令牌，则禁止访问。
            requestContext.setSendZuulResponse(false);
            requestContext.setResponseStatusCode(
                    HttpStatus.TOO_MANY_REQUESTS.value());
        }

        return null;
    }
}
