package com.example.demo.controller.nhanvien;

import com.example.demo.entity.nhanvien.nhanVien;
import com.example.demo.entity.nhanvien.nhanVienVM;
import com.example.demo.repo.nhanvien.chucVuRepository;
import com.example.demo.repo.nhanvien.nhanVienRepository;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@Controller
@RequestMapping("nhan-vien")
public class nhanVienController {
    @Autowired
    private nhanVienRepository nvRepo;

    @Autowired
    private chucVuRepository cvRepo;

    @GetMapping("index")
    public String index(
            Model model
    ){
        nhanVienVM vm = new nhanVienVM();
        model.addAttribute("data",vm);
        model.addAttribute("action","/nhan-vien/store");
        model.addAttribute("listCV",this.cvRepo.findAll());
        model.addAttribute("listNV",this.nvRepo.findAll());

        return "nhanVien/index";
    }
    @GetMapping("edit/{id}")
    public String edit(
            Model model,
            @PathVariable("id") nhanVien nv
    ) {
        model.addAttribute("data", nv);
        model.addAttribute("action","/nhan-vien/update/"+ nv.getId());
        model.addAttribute("listCV", cvRepo.findAll());
        model.addAttribute("listNV", nvRepo.findAll());
        return "nhanVien/index";
    }
    @GetMapping("delete/{id}")
    public String delete(
            @PathVariable("id") nhanVien nv
    ){
        this.nvRepo.delete(nv);
        return "redirect:/nhan-vien/index";
    }
    @GetMapping("create")
    public String create(
            Model  model
    ){
        nhanVienVM vm = new nhanVienVM();
        model.addAttribute("data",vm);
        model.addAttribute("action","/nhan-vien/store");
        model.addAttribute("listCV",this.cvRepo.findAll());
        return "nhanVien/index";
    }
    @PostMapping("store")
    public String store(
            Model model,
            @Valid @ModelAttribute("data")nhanVienVM vm,
            BindingResult result
    ){
        if (result.hasErrors()){
            model.addAttribute("listCV",this.cvRepo.findAll());
            model.addAttribute("listNV", nvRepo.findAll());
            return "nhanVien/index";
        }
        nhanVien nv = new nhanVien();
        nv.loadView(vm);
        this.nvRepo.save(nv);
        return "redirect:/nhan-vien/index";
    }
    @PostMapping("update/{id}")
    public String update(
            @PathVariable("id")nhanVien nv,
            Model model,
            @Valid @ModelAttribute("data") nhanVienVM vm,
            BindingResult result
    ){
        if (result.hasErrors()){
            model.addAttribute("listCV",this.cvRepo.findAll());
            return "nhanVien/index";
        }
        nv.loadView(vm);
        this.nvRepo.save(nv);
        return "redirect:/nhan-vien/index";
    }
}
