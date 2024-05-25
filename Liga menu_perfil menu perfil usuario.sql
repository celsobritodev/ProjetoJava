SELECT mp.idMenu,m.nome,link,icone,exibir,mp.idPerfil,p.nome,u.nome FROM menu_perfil AS mp 
INNER JOIN menu AS M 
INNER JOIN perfil AS p
INNER JOIN usuario as u
ON mp.idMenu=m.idMenu AND mp.idPerfil=p.idPerfil AND u.idPerfil=p.idPerfil
WHERE mp.idPerfil=1;