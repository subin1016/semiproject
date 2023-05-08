package mul.cam.a.util;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import mul.cam.a.dto.ProductDto;

public class productUtil {

	public static List<ProductDto> getProductdata(String url, int count) throws Exception {
		
		Document doc = Jsoup.connect(url).get();
		
		Elements titles = doc.select("div.slide div.info span.text");		
		Elements prices = doc.select("div.slide div.info span.price");	
		Elements imgurls = doc.select("div.slide span.img img");
		
		List<ProductDto> list = new ArrayList<ProductDto>();
		
		for (int i = 0; i < count; i++) {
			Element title = titles.get(i);
			Element price = prices.get(i);
			Element imgurl = imgurls.get(i);
			
			String t = title.text();			
			String p = price.text();
			String img = imgurl.attr("abs:src");
			
			list.add(new ProductDto(t, p, img));			
		}
		
		return list;
	}
	
	public static List<ProductDto> getBannerDate(String url, int count) throws Exception {
		
		Document doc = Jsoup.connect(url).get();
		
		Elements titles = doc.select("div#theme_area span.title");		
		Elements prices = doc.select("div#theme_area span.price");	
		Elements imgurls = doc.select("div#theme_area img");
		
		List<ProductDto> list = new ArrayList<ProductDto>();
		
		for (int i = 0; i < count; i++) {
			Element title = titles.get(i);
			Element price = prices.get(i);
			Element imgurl = imgurls.get(i);
			
			String t = title.text();			
			String p = price.text();
			String img = imgurl.attr("abs:src");
			
			list.add(new ProductDto(t, p, img));			
		}
		
		return list;
	}
	
}
