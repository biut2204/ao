package com.example.demo.controller.sanpham;

import com.example.demo.entity.sanpham.*;
import com.example.demo.repo.sanpham.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.UUID;

@Controller
public class ProductsController {
    @Autowired
    AoDAO aoDAO;
    @Autowired
    Ao_chi_tietDAO ao_chi_tietDAO;
    @Autowired
    Chat_vaiDAO chat_vaiDAO;
    @Autowired
    Co_aoDAO co_aoDAO;
    @Autowired
    Cuc_aoDAO cuc_aoDAO;
    @Autowired
    FormDAO formDAO;
    @Autowired
    HangDAO hangDAO;
    @Autowired
    Hoa_tietDAO hoa_tietDAO;
    @Autowired
    Nep_che_aoDAO nep_che_aoDAO;
    @Autowired
    Tay_aoDAO tay_aoDAO;
    @Autowired
    Tui_aoDAO tui_aoDAO;
    @Autowired
    Mau_sacDAO mau_sacDAO;
    @Autowired
    SizeDAO sizeDAO;
    @Autowired
    Huong_dan_bao_quanDAO huong_dan_bao_quanDAO;
    @Autowired
    AnhDAO anhDAO;
    @RequestMapping("/product")
    public String product(Model model){
        model.addAttribute("items",aoDAO.findAll());
        return "product/index";
    }
    @RequestMapping("/product/{x}")
    public String productDetail(Model model, @PathVariable("x") String x){
        model.addAttribute("items",aoDAO.findAll());
        return "product/index";
    }
    @RequestMapping("/product/create")
    public String productCreate(Model model){
        model.addAttribute("items",aoDAO.findAll());
        return "product/create";
    }
    @RequestMapping("/product/update/{x}")
    public String productUpdate(Model model,@PathVariable("x") String x){
        model.addAttribute("itemsdetail",ao_chi_tietDAO.getAllByMaAo(x));
        model.addAttribute("anh",anhDAO.getAnhByMaAo(x));
        model.addAttribute("item",aoDAO.getAoByMa(x));
        return "product/update";
    }
    @RequestMapping(value = "/product/update/{x}",params = "spct")
    public String productUpdate1(Model model, @PathVariable("x") String x, @RequestParam("spct")UUID spct){
        model.addAttribute("itemsdetail",ao_chi_tietDAO.getAllByMaAo(x));
        model.addAttribute("aochitiet",ao_chi_tietDAO.findById(spct).get());
        model.addAttribute("item",aoDAO.getAoByMa(x));
        return "product/update";
    }
    @PostMapping("/product/update/{x}")
    public String productUpdate2(Model model,@ModelAttribute("item") Ao ao){
        aoDAO.save(ao);
        return "redirect:/product/update/"+ao.getMa();
    }
    @PostMapping("/product/create")
    public String productCreate2(Model model,@ModelAttribute("sp") Ao ao){
        System.out.println(ao);
        String ma= aoDAO.save(ao).getMa();
        model.addAttribute("items",aoDAO.findAll());
        return "redirect:/product/update/"+ma;
    }
    @PostMapping("/product/createact")
    public String productCreateAct(Model model, @ModelAttribute("sp")Ao_chi_tiet ao_chi_tiet, @RequestParam("ma") String ma){
        System.out.println("Xin chao pro");
        ao_chi_tietDAO.save(ao_chi_tiet);
        return "redirect:/product/update/"+ma;
    }
    //co ao
    @RequestMapping("/product/coao")
    public String coao(Model model){
        model.addAttribute("items",co_aoDAO.findAll());
        return "product/coao";
    }
    @PostMapping("/product/coao")
    public String Createcoao(Model model,@ModelAttribute("item")Co_ao co_ao){
        co_aoDAO.save(co_ao);
        return "redirect:/product/coao";
    }
    @RequestMapping("/product/detail/coao/{x}")
    public String detaiCoao(Model model,@PathVariable("x")String x){
        model.addAttribute("item",co_aoDAO.getCo_aoByMa(x));
        model.addAttribute("items",co_aoDAO.findAll());
        return "product/coao";
    }
    //cuc ao
    @RequestMapping("/product/cucao")
    public String cucao(Model model){
        model.addAttribute("items",cuc_aoDAO.findAll());
        return "product/cucao";
    }
    @PostMapping("/product/cucao")
    public String Createcucao(Model model,@ModelAttribute("item")Cuc_ao cuc_ao){
        cuc_aoDAO.save(cuc_ao);
        return "redirect:/product/cucao";
    }
    @RequestMapping("/product/detail/cucao/{x}")
    public String detaiCucao(Model model,@PathVariable("x")String x){
        model.addAttribute("item",cuc_aoDAO.getcuc_aoByMa(x));
        model.addAttribute("items",cuc_aoDAO.findAll());
        return "product/cucao";
    }
    //
    @RequestMapping("/product/form")
    public String form(Model model){
        model.addAttribute("items",formDAO.findAll());
        return "product/form";
    }
    @PostMapping("/product/form")
    public String Createform(Model model,@ModelAttribute("item")Form form){
        formDAO.save(form);
        return "redirect:/product/form";
    }
    @RequestMapping("/product/detail/form/{x}")
    public String detaiform(Model model,@PathVariable("x")String x){
        model.addAttribute("item",formDAO.getFormByMa(x));
        model.addAttribute("items",formDAO.findAll());
        return "product/form";
    }
    //
    @RequestMapping("/product/hang")
    public String hang(Model model){
        model.addAttribute("items",hangDAO.findAll());
        return "product/hang";
    }
    @PostMapping("/product/hang")
    public String Createhang(Model model,@ModelAttribute("item")Hang hang){
        hangDAO.save(hang);
        return "redirect:/product/hang";
    }
    @RequestMapping("/product/detail/hang/{x}")
    public String detaihang(Model model,@PathVariable("x")String x){
        model.addAttribute("item",hangDAO.getHangByMa(x));
        model.addAttribute("items",hangDAO.findAll());
        return "product/hang";
    }
    //
    @RequestMapping("/product/hoatiet")
    public String hoatiet(Model model){
        model.addAttribute("items",hoa_tietDAO.findAll());
        return "product/hoatiet";
    }
    @PostMapping("/product/hoatiet")
    public String Createhoatiet(Model model,@ModelAttribute("item")Hoa_tiet hoa_tiet){
        hoa_tietDAO.save(hoa_tiet);
        return "redirect:/product/hoatiet";
    }
    @RequestMapping("/product/detail/hoatiet/{x}")
    public String detaihoatiet(Model model,@PathVariable("x")String x){
        model.addAttribute("item",hoa_tietDAO.getHoa_tietByMa(x));
        model.addAttribute("items",hoa_tietDAO.findAll());
        return "product/hoatiet";
    }
    //
    @RequestMapping("/product/mausac")
    public String mausac(Model model){
        model.addAttribute("items",mau_sacDAO.findAll());
        return "product/mausac";
    }
    @PostMapping("/product/mausac")
    public String Createmausac(Model model,@ModelAttribute("item")Mau_sac mau_sac){
        mau_sacDAO.save(mau_sac);
        return "redirect:/product/mausac";
    }
    @RequestMapping("/product/detail/mausac/{x}")
    public String detaimausac(Model model,@PathVariable("x")String x){
        model.addAttribute("item",mau_sacDAO.getMau_sacByMa(x));
        model.addAttribute("items",mau_sacDAO.findAll());
        return "product/mausac";
    }
    //
    @RequestMapping("/product/nepcheao")
    public String nepcheao(Model model){
        model.addAttribute("items",nep_che_aoDAO.findAll());
        return "product/nepcheao";
    }
    @PostMapping("/product/nepcheao")
    public String Createnepcheao(Model model,@ModelAttribute("item")Nep_che_ao nep_che_ao){
        nep_che_aoDAO.save(nep_che_ao);
        return "redirect:/product/nepcheao";
    }
    @RequestMapping("/product/detail/nepcheao/{x}")
    public String detainepcheao(Model model,@PathVariable("x")String x){
        model.addAttribute("item",nep_che_aoDAO.getNep_che_aoByMa(x));
        model.addAttribute("items",nep_che_aoDAO.findAll());
        return "product/nepcheao";
    }
    //
    @RequestMapping("/product/size")
    public String size(Model model){
        model.addAttribute("items",sizeDAO.findAll());
        return "product/size";
    }
    @PostMapping("/product/size")
    public String Createsize(Model model,@ModelAttribute("item")Size size){
        sizeDAO.save(size);
        return "redirect:/product/size";
    }
    @RequestMapping("/product/detail/size/{x}")
    public String detaisize(Model model,@PathVariable("x")String x){
        model.addAttribute("item",sizeDAO.getSizeByMa(x));
        model.addAttribute("items",sizeDAO.findAll());
        return "product/size";
    }
    //
    @RequestMapping("/product/tayao")
    public String tayao(Model model){
        model.addAttribute("items",tay_aoDAO.findAll());
        return "product/tayao";
    }
    @PostMapping("/product/tayao")
    public String Createtayao(Model model,@ModelAttribute("item")Tay_ao tay_ao){
        tay_aoDAO.save(tay_ao);
        return "redirect:/product/tayao";
    }
    @RequestMapping("/product/detail/tayao/{x}")
    public String detaitayao(Model model,@PathVariable("x")String x){
        model.addAttribute("item",tay_aoDAO.getTay_aoByMa(x));
        model.addAttribute("items",tay_aoDAO.findAll());
        return "product/tayao";
    }
    //
    @RequestMapping("/product/tuiao")
    public String tuiao(Model model){
        model.addAttribute("items",tui_aoDAO.findAll());
        return "product/tuiao";
    }
    @PostMapping("/product/tuiao")
    public String Createtuiao(Model model,@ModelAttribute("item")Tui_ao tui_ao){
        tui_aoDAO.save(tui_ao);
        return "redirect:/product/tuiao";
    }
    @RequestMapping("/product/detail/tuiao/{x}")
    public String detaituiao(Model model,@PathVariable("x")String x){
        model.addAttribute("item",tui_aoDAO.getTui_aoByMa(x));
        model.addAttribute("items",tui_aoDAO.findAll());
        return "product/tuiao";
    }
    //
    @RequestMapping("/product/huongdanbaoquan")
    public String huongdanbaoquan(Model model){
        model.addAttribute("items",huong_dan_bao_quanDAO.findAll());
        return "product/huongdanbaoquan";
    }
    @PostMapping("/product/add-huongdanbaoquan")
    public String Createhuongdanbaoquan(Model model,@ModelAttribute("item")Huong_dan_bao_quan huong_dan_bao_quan){
        huong_dan_bao_quanDAO.save(huong_dan_bao_quan);
        return "redirect:/product/huongdanbaoquan";
    }
    @RequestMapping("/product/detail/huongdanbaoquan/{x}")
    public String detaihuongdanbaoquan(Model model,@PathVariable("x")String x){
        model.addAttribute("item",huong_dan_bao_quanDAO.getHuong_dan_bao_quanByMa(x));
        model.addAttribute("items",huong_dan_bao_quanDAO.findAll());
        return "product/huongdanbaoquan";
    }
    //
    @RequestMapping("/product/chatvai")
    public String chatvai(Model model){
        model.addAttribute("items",chat_vaiDAO.findAll());
        return "product/chatvai";
    }
    @PostMapping("/product/chatvai")
    public String Createchatvai(Model model,@ModelAttribute("item")Chat_vai chat_vai){
        chat_vaiDAO.save(chat_vai);
        return "redirect:/product/chatvai";
    }
    @RequestMapping("/product/detail/chatvai/{x}")
    public String detaichatvai(Model model,@PathVariable("x")String x){
        model.addAttribute("item",chat_vaiDAO.getChat_vaiByMa(x));
        model.addAttribute("items",chat_vaiDAO.findAll());
        return "product/chatvai";
    }
    @PostMapping("/product/createanh")
    public String createanh(Model model,HttpServletRequest request,Anh anh,@RequestParam("ma")String ma, @RequestPart("ten_url1") MultipartFile file) throws IOException, ServletException {
//        File dir = new File(request.getServletContext().getRealPath("/files"));
//        if (!dir.exists()) {
//            dir.mkdirs();
//            System.out.println("1");
//        }
//        try {
//            File saveFile = new File(dir, file.getOriginalFilename());
////            chuyển file upload vào đườn dẫn saveFile
//            file.transferTo(saveFile);
//        } catch (Exception e) {
//            throw new RuntimeException(e);
//        }
        Path path = Paths.get("src/main/webapp/images/");

        try {
            InputStream inputStream = file.getInputStream();
            Files.copy(inputStream,path.resolve(file.getOriginalFilename()), StandardCopyOption.REPLACE_EXISTING);

        } catch (IOException e) {
            e.printStackTrace();
        }
        anh.setTen_url(file.getOriginalFilename());
        anhDAO.save(anh);
        return "redirect:/product/update/"+ma;
    }
    @ModelAttribute("cv")
    public List<Chat_vai> getListChat_vais(){
        return chat_vaiDAO.findAll();
    }
    @ModelAttribute("coao")
    public List<Co_ao> getListCo_aos(){
        return co_aoDAO.findAll();
    }
    @ModelAttribute("cucao")
    public List<Cuc_ao> getListCuc_aos(){
        return cuc_aoDAO.findAll();
    }
    @ModelAttribute("form")
    public List<Form> getListForms(){
        return formDAO.findAll();
    }
    @ModelAttribute("hang")
    public List<Hang> getListHangs(){
        return hangDAO.findAll();
    }
    @ModelAttribute("hoatiet")
    public List<Hoa_tiet> getListHoa_tiets(){
        return hoa_tietDAO.findAll();
    }
    @ModelAttribute("nepcheao")
    public List<Nep_che_ao> getListNep_che_aos(){
        return nep_che_aoDAO.findAll();
    }
    @ModelAttribute("tayao")
    public List<Tay_ao> getListTay_aos(){
        return tay_aoDAO.findAll();
    }
    @ModelAttribute("tuiao")
    public List<Tui_ao> getListTui_aos(){
        return tui_aoDAO.findAll();
    }
    @ModelAttribute("mausac")
    public List<Mau_sac> getListMau_sacs(){
        return mau_sacDAO.findAll();
    }
    @ModelAttribute("size")
    public List<Size> getListSizes(){
        return sizeDAO.findAll();
    }
    @ModelAttribute("hdbq")
    public List<Huong_dan_bao_quan> getListHuong_dan_bao_quans(){
        return huong_dan_bao_quanDAO.findAll();
    }
}
