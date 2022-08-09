import express from "express";
import morgan from "morgan";

//Routes
import sportRoutes from "./routes/sports.routes"
const app = express();
//setings
app.set("port", 3000);
//Middlewares
app.use(morgan("dev"));
app.use(express.json());
//Routes
app.use("/api/sports", sportRoutes);

export default app;