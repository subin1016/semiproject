package Util;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import dto.MovieDto;
import dto.PackageDto;

import org.jsoup.Jsoup;

public class PackageUtil {
	
	public static List<PackageDto> getPackageData() throws Exception {
		
		Document doc = Jsoup.connect("https://www.hanatour.com/trp/pkg/CHPC0PKG0100M200?catgProdAttrCd=P01&cntryCd=VN&cityCd=DAD&depCityCd=JCN").get();

		Elements titles = doc.select("div.inr right strong.item_title");		
		//Elements costs = doc.select("div.box-contents div.score strong.percent span");
		//Elements imageurl = doc.select("div.box-contents div.score strong.percent span");
		
		List<PackageDto> list = new ArrayList<PackageDto>();
		
		for (int i = 0; i < 19; i++) {
			Element title = titles.get(i);
			//Element costs = costs.get(i);
			
			String t = title.text();			
			//double p = Double.parseDouble( costs.text().replace("%", "") );
			System.out.println(t);
			//list.add(new PackageDto(t, p));			
		}
		
		return list;
		
	}

}
