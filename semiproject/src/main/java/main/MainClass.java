package main;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import dto.PackageDto;

public class MainClass {

	public static void main(String[] args) throws Exception {

		Document doc = Jsoup.connect("https://www.hanatour.com/trp/pkg/CHPC0PKG0100M200?cntryCd=VN&cityCd=DAD&depCityCd=JCN&strtDepDay=20230401&endDepDay=20230430&catgProdAttrCd=P01&cityCdNm=%EB%8B%A4%EB%82%AD").get();
		
		Elements title = doc.getElementsByClass("item_title.eps3");
		System.out.println(title);
		
		//Elements titles = doc.select("div.inr.right div.prod_list_wrap ul li");
		//Elements costs = doc.select("div.box-contents div.score strong.percent span");
		//Elements imageurl = doc.select("div.box-contents div.score strong.percent span");
		List<PackageDto> list = new ArrayList<PackageDto>();

		for (int i = 0; i < 10; i++) {
			//Element title = titles.get(i);
			//Element costs = costs.get(i);
			
			String t = title.text();			
			//double p = Double.parseDouble( costs.text().replace("%", "") );
			System.out.println(t);
			//list.add(new PackageDto(t, p));			
		}

	}

}