import {request, Router} from "express";
import { methods as  sportsController} from "../controllers/sports.controller";
const router = Router();

router.get("/", sportsController.getPrueba);
router.get("/:id", sportsController.getRegorAdm);
router.post("/login", sportsController.getRegisterorAdmin);

export default router;