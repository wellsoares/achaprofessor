package br.com.professor.interfaces;

import br.com.professores.model.ServerLocation;


public interface ServerLocationBo {
	ServerLocation getLocation(String ipAddress);
}
