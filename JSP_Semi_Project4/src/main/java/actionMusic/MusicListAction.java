package actionMusic;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;
import persistence.*;
import action.Action;
import action.ActionForward;
import model.MusicVO;

public class MusicListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		MusicDAO dao = MusicDAO.getInstance();
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("sessionId");
		
		int rowsize = 6;
		int block = 3;
		int totalRecord = 0;
		int allPage = 0;
		int page = 0;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}else {
			page = 1;
		}
		int startNo = (page * rowsize) - (rowsize - 1);
		int endNo = (page * rowsize);
		int startBlock = (((page -1) / block) * block) + 1;
		int endBlock = (((page -1) / block) * block) + block;
		totalRecord = dao.getPageingCount(user_id);
	
		allPage = (int)Math.ceil(totalRecord / (double)rowsize);
		
		if(endBlock > allPage) {  // 마지막에 5페이지로 끝날경우 보여지는 것은 6페이지 까지 보여지는 데 6페이지에는 데이터가 없으니 5페이지에서 끝날 수 있게 해주는 방법.
			endBlock = allPage;
		}
		
		
		List<MusicVO> musicList = dao.getPageingList(page, rowsize, user_id);
		
		
		request.setAttribute("page", page);
		request.setAttribute("rowsize", rowsize);
		request.setAttribute("block", block);
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("allPage", allPage);
		request.setAttribute("startNo", startNo);
		request.setAttribute("endNo", endNo);
		request.setAttribute("startBlock", startBlock);
		request.setAttribute("endBlock", endBlock);
		request.setAttribute("musicList", musicList);  // 이녀석이 페이지를 넘겨 받는 값 이녀석이 jsp에서 문자가 똑같아야 함.
		
		ActionForward forward = new ActionForward();

		forward.setRedirect(false);

		forward.setPath("/musicBbs/music_list.jsp");

		return forward;

	}

}
