package demo.util;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

/**
 * Created by ${李朋}
 * on 2017/6/14.
 * filter 过滤器\ ['fɪltə] encoding 编码\ [ɪn'kəʊdɪŋ]
 */
@WebFilter(urlPatterns = "/*")
public class EncodingFilter implements Filter {
    private static final String ENCODING = "UTF-8";
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {


    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        request.setCharacterEncoding(ENCODING);
        response.setCharacterEncoding(ENCODING);
        // chain 链\ [tʃeɪn] jQuery
        chain.doFilter(request,response);
    }

    @Override
    public void destroy() {
        // destroy 销毁

    }
}
