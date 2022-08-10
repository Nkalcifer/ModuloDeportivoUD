import {request, Router} from "express";
import { methods as  sportsController} from "../controllers/sports.controller";
const router = Router();

router.get("/", sportsController.getPrueba);
router.post("/", sportsController.getRegisterorAdmin);
router.get("/login/:id", sportsController.getRegorAdm);
router.get("/asisProfe/:nombreprofe", sportsController.getasisDocente);
router.get("/asisgetEquipo/:codigo/:equipo", sportsController.getasisEquipo);
router.get("/asisPasante/:codigo", sportsController.getasisPasante);
router.get("/equipos", sportsController.getEquipos);
router.post("/checkProfe", sportsController.postasisProfe);
router.post("/checkPas", sportsController.postasisPasante);
router.post("/prestar", sportsController.postPrestamo);
router.post("/prestar/pasante", sportsController.postPrestamoPasante);
router.post("/asisEquipo", sportsController.postEquipo);
export default router;