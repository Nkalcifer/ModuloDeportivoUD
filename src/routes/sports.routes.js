import {request, Router} from "express";
import { methods as  sportsController} from "../controllers/sports.controller";
const router = Router();

router.get("/", sportsController.getPrueba);
router.post("/", sportsController.getRegisterorAdmin);
router.get("/login/:id", sportsController.getRegorAdm);
router.get("/asisProfe/:nombreprofe", sportsController.getasisDocente);
router.get("/asisEquipo/:codigo/:equipo", sportsController.getasisEquipo);
router.get("/asisPasante/:codigo", sportsController.getasisPasante);
router.get("/equipos", sportsController.getEquipos);
export default router;