package com.bitc.project.controller;

import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitc.project.service.NoteService;
import com.bitc.project.util.Criteria;
import com.bitc.project.util.PageMaker;
import com.bitc.project.vo.NoteVO;

@Controller
@RequestMapping("note")
public class NoteController {
	
	@Autowired
	private NoteService ns;

	@GetMapping("note")
    public void note(Model model, Criteria cri,HttpServletRequest request) throws Exception {
		String id = request.getParameter("id");
		cri.setPerPageNum(5);
        List<NoteVO> notes = ns.noteVOList(cri,id);
        model.addAttribute("notes", notes);
        PageMaker pm = ns.getPageMaker(cri,id);
        model.addAttribute("pm",pm);
    }
	
	@GetMapping("noteWrite")
    public String createNoteForm() {
        return "note/noteWrite";
    }

    @PostMapping("noteWrite")
    public String createNote(
    		NoteVO vo,
    		RedirectAttributes rttr
    		) throws Exception{
       ns.createNote(vo);
       rttr.addAttribute("message","쪽지를 보냈습니다");
        
        return "redirect:/note/note";
    }
    
    @GetMapping("noteDetail")
    public String noteDetail(
    		@RequestParam("nno")
    		int nno, Model model
    		) throws Exception {
        NoteVO note = ns.read(nno);
        model.addAttribute("note", note);
        return "note/noteDetail";
    }
    
    @GetMapping("noteReply")
    public String noteReply() throws Exception {
    	
    	
		return null;
    	
    }
    
    @PostMapping("delete")
    public String delete(int[] nno) throws Exception {
    	for(int i = 0; i < nno.length; i++) {
    		ns.delete(nno[i]);
    	}
    	
    	return "redirect:/note/note";
    	
    }
  }

	
