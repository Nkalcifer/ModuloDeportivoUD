import {config} from "dotenv";

config();

export default{
    user: process.env.USER || "",
    password: process.env.PASSWORD || "",
    host: process.env.HOST || "",
    port: process.env.PORT || "",
    database: process.env.DATABASE || ""
};