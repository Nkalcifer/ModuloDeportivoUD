import express from "express";
import morgan from "morgan";

//Routes
// import sportRoutes from ".routes/sports.routes"
const app = express();
//setings
app.set("port", 3000);
//Middlewares
app.use(morgan("dev"));
//Routes
// app.use("/sports", sportRoutes);
export default app;