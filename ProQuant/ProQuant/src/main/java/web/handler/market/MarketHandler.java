package web.handler.market;

import PO.marketInfoPO.MarketInfo;
import PO.recommendedStock.PeakPO;
import PO.recommendedStock.breakthroughPO;
import VO.marketPageVO.HotStockListVO;
import data.RecommendedData.PeakUp;
import dataservice.MarketInfoService;
import dataservice.recommendedData.BreakthroughService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;

/**
 * Created by xiaoJun on 2017/6/6.
 */

@Controller
public class MarketHandler {
    @Autowired
    private MarketInfoService marketInfoService;
    @Autowired
    @Qualifier("PeU")
    private PeakUp peakUpService;

    @Autowired
    @Qualifier("BU")
    private BreakthroughService breakthroughService;

    @RequestMapping("/MarketPage")
    public String toMarketPage(Model model, HttpServletRequest request){
        MarketInfo marketInfo = marketInfoService.getCurrentMarketInfo();
        model.addAttribute("marketInfo", marketInfo);

//        ArrayList<PeakPO> hotStockPOS = peakUpService.getDatas();
//        System.out.println(hotStockPOS.size());
//        model.addAttribute("hotStocks", hotStockPOS);

        ArrayList<breakthroughPO> hotStockPOS = breakthroughService.getDatas();
        System.out.println(hotStockPOS.size());
        model.addAttribute("hotStocks", hotStockPOS);
//        HotStockListVO hotStockListVO = new HotStockListVO(hotStockPOS);
//        request.getSession().setAttribute("hotStocks", hotStockListVO);

//        ArrayList<PeakPO> hotStockPOS = peakUpService.getDatas();
//        model.addAttribute("hotStocks", hotStockPOS);
        return "MarketPage";
    }
}
