import { Router } from "express";
import { methods as sportsController } from "../controllers/sports.controller";

const router = Router();

router.get("/", sportsController.getAuxiliar);

export default router;