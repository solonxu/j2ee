package org.pu.erp.web.session;

import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.StringTokenizer;
import java.util.TreeMap;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.Validate;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.google.common.net.HttpHeaders;

public class Servlets {
	// -- 甯哥敤鏁板�煎畾涔� --//
		public static final long ONE_YEAR_SECONDS = 60 * 60 * 24 * 365;
		
		// 闈欐�佹枃浠跺悗缂�
		private final static String[] staticFiles = StringUtils.split(GlobalConstant.WEB_STATIC_FILE, ",");
		
		// 鍔ㄦ�佹槧灏刄RL鍚庣紑
		private final static String urlSuffix = ".html";

		/**
		 * 璁剧疆瀹㈡埛绔紦瀛樿繃鏈熸椂闂� 鐨凥eader.
		 */
		public static void setExpiresHeader(HttpServletResponse response, long expiresSeconds) {
			// Http 1.0 header, set a fix expires date.
			response.setDateHeader(HttpHeaders.EXPIRES, System.currentTimeMillis() + expiresSeconds * 1000);
			// Http 1.1 header, set a time after now.
			response.setHeader(HttpHeaders.CACHE_CONTROL, "private, max-age=" + expiresSeconds);
		}

		/**
		 * 璁剧疆绂佹瀹㈡埛绔紦瀛樼殑Header.
		 */
		public static void setNoCacheHeader(HttpServletResponse response) {
			// Http 1.0 header
			response.setDateHeader(HttpHeaders.EXPIRES, 1L);
			response.addHeader(HttpHeaders.PRAGMA, "no-cache");
			// Http 1.1 header
			response.setHeader(HttpHeaders.CACHE_CONTROL, "no-cache, no-store, max-age=0");
		}

		/**
		 * 璁剧疆LastModified Header.
		 */
		public static void setLastModifiedHeader(HttpServletResponse response, long lastModifiedDate) {
			response.setDateHeader(HttpHeaders.LAST_MODIFIED, lastModifiedDate);
		}

		/**
		 * 璁剧疆Etag Header.
		 */
		public static void setEtag(HttpServletResponse response, String etag) {
			response.setHeader(HttpHeaders.ETAG, etag);
		}

		/**
		 * 鏍规嵁娴忚鍣↖f-Modified-Since Header, 璁＄畻鏂囦欢鏄惁宸茶淇敼.
		 * 
		 * 濡傛灉鏃犱慨鏀�, checkIfModify杩斿洖false ,璁剧疆304 not modify status.
		 * 
		 * @param lastModified 鍐呭鐨勬渶鍚庝慨鏀规椂闂�.
		 */
		public static boolean checkIfModifiedSince(HttpServletRequest request, HttpServletResponse response,
				long lastModified) {
			long ifModifiedSince = request.getDateHeader(HttpHeaders.IF_MODIFIED_SINCE);
			if ((ifModifiedSince != -1) && (lastModified < ifModifiedSince + 1000)) {
				response.setStatus(HttpServletResponse.SC_NOT_MODIFIED);
				return false;
			}
			return true;
		}

		/**
		 * 鏍规嵁娴忚鍣� If-None-Match Header, 璁＄畻Etag鏄惁宸叉棤鏁�.
		 * 
		 * 濡傛灉Etag鏈夋晥, checkIfNoneMatch杩斿洖false, 璁剧疆304 not modify status.
		 * 
		 * @param etag 鍐呭鐨凟Tag.
		 */
		public static boolean checkIfNoneMatchEtag(HttpServletRequest request, HttpServletResponse response, String etag) {
			String headerValue = request.getHeader(HttpHeaders.IF_NONE_MATCH);
			if (headerValue != null) {
				boolean conditionSatisfied = false;
				if (!"*".equals(headerValue)) {
					StringTokenizer commaTokenizer = new StringTokenizer(headerValue, ",");

					while (!conditionSatisfied && commaTokenizer.hasMoreTokens()) {
						String currentToken = commaTokenizer.nextToken();
						if (currentToken.trim().equals(etag)) {
							conditionSatisfied = true;
						}
					}
				} else {
					conditionSatisfied = true;
				}

				if (conditionSatisfied) {
					response.setStatus(HttpServletResponse.SC_NOT_MODIFIED);
					response.setHeader(HttpHeaders.ETAG, etag);
					return false;
				}
			}
			return true;
		}

		/**
		 * 璁剧疆璁╂祻瑙堝櫒寮瑰嚭涓嬭浇瀵硅瘽妗嗙殑Header.
		 * 
		 * @param fileName 涓嬭浇鍚庣殑鏂囦欢鍚�.
		 */
		public static void setFileDownloadHeader(HttpServletResponse response, String fileName) {
			try {
				// 涓枃鏂囦欢鍚嶆敮鎸�
				String encodedfileName = new String(fileName.getBytes(), "ISO8859-1");
				response.setHeader(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + encodedfileName + "\"");
			} catch (UnsupportedEncodingException e) {
				e.getMessage();
			}
		}

		/**
		 * 鍙栧緱甯︾浉鍚屽墠缂�鐨凴equest Parameters, copy from spring WebUtils.
		 * 
		 * 杩斿洖鐨勭粨鏋滅殑Parameter鍚嶅凡鍘婚櫎鍓嶇紑.
		 */
		@SuppressWarnings("rawtypes")
		public static Map<String, Object> getParametersStartingWith(ServletRequest request, String prefix) {
			Validate.notNull(request, "Request must not be null");
			Enumeration paramNames = request.getParameterNames();
			Map<String, Object> params = new TreeMap<String, Object>();
			String pre = prefix;
			if (pre == null) {
				pre = "";
			}
			while (paramNames != null && paramNames.hasMoreElements()) {
				String paramName = (String) paramNames.nextElement();
				if ("".equals(pre) || paramName.startsWith(pre)) {
					String unprefixed = paramName.substring(pre.length());
					String[] values = request.getParameterValues(paramName);
					if (values == null || values.length == 0) {
						values = new String[]{};
						// Do nothing, no values found at all.
					} else if (values.length > 1) {
						params.put(unprefixed, values);
					} else {
						params.put(unprefixed, values[0]);
					}
				}
			}
			return params;
		}

		/**
		 * 缁勫悎Parameters鐢熸垚Query String鐨凱arameter閮ㄥ垎,骞跺湪paramter name涓婂姞涓妏refix.
		 * 
		 */
		public static String encodeParameterStringWithPrefix(Map<String, Object> params, String prefix) {
			StringBuilder queryStringBuilder = new StringBuilder();

			String pre = prefix;
			if (pre == null) {
				pre = "";
			}
			Iterator<Entry<String, Object>> it = params.entrySet().iterator();
			while (it.hasNext()) {
				Entry<String, Object> entry = it.next();
				queryStringBuilder.append(pre).append(entry.getKey()).append("=").append(entry.getValue());
				if (it.hasNext()) {
					queryStringBuilder.append("&");
				}
			}
			return queryStringBuilder.toString();
		}

		/**
		 * 瀹㈡埛绔Http Basic楠岃瘉鐨� Header杩涜缂栫爜.
		 */
//		public static String encodeHttpBasic(String userName, String password) {
//			String encode = userName + ":" + password;
//			return "Basic " + Encodes.encodeBase64(encode.getBytes());
//		}
		
//		/**
//		 * 鏄惁鏄疉jax寮傛璇锋眰
//		 * @param request
//		 */
//		public static boolean isAjaxRequest(HttpServletRequest request){
//			
//			String accept = request.getHeader("accept");
//			String xRequestedWith = request.getHeader("X-Requested-With");
//			Principal principal = UserUtils.getPrincipal();
//
//			// 濡傛灉鏄紓姝ヨ姹傛垨鏄墜鏈虹锛屽垯鐩存帴杩斿洖淇℃伅
//			return ((accept != null && accept.indexOf("application/json") != -1 
//				|| (xRequestedWith != null && xRequestedWith.indexOf("XMLHttpRequest") != -1)
//				|| (principal != null && principal.isMobileLogin())));
//		}
		
		/**
		 * 鑾峰彇褰撳墠璇锋眰瀵硅薄
		 * @return
		 */
		public static HttpServletRequest getRequest(){
			try{
				return ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
			}catch(Exception e){
				return null;
			}
		}

		/**
	     * 鍒ゆ柇璁块棶URI鏄惁鏄潤鎬佹枃浠惰姹�
		 * @throws Exception 
	     */
	    public static boolean isStaticFile(String uri){
			if (staticFiles == null){
				try {
					throw new Exception("妫�娴嬪埌鈥渁pp.properties鈥濅腑娌℃湁閰嶇疆鈥渨eb.staticFile鈥濆睘鎬с�傞厤缃ず渚嬶細\n#闈欐�佹枃浠跺悗缂�\n"
						+"web.staticFile=.css,.js,.png,.jpg,.gif,.jpeg,.bmp,.ico,.swf,.psd,.htc,.crx,.xpi,.exe,.ipa,.apk");
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
//			if ((StringUtils.startsWith(uri, "/static/") || StringUtils.endsWithAny(uri, sfs)) 
//					&& !StringUtils.endsWithAny(uri, ".jsp") && !StringUtils.endsWithAny(uri, ".java")){
//				return true;
//			}
			if (StringUtils.endsWithAny(uri, staticFiles) && !StringUtils.endsWithAny(uri, urlSuffix)
					&& !StringUtils.endsWithAny(uri, ".jsp") && !StringUtils.endsWithAny(uri, ".java")){
				return true;
			}
			return false;
	    }
	

}
