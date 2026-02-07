package com.example.est

import io.ktor.server.application.*
import io.ktor.server.engine.*
import io.ktor.server.netty.*
import io.ktor.server.html.*
import kotlinx.html.*
import org.apache.poi.xssf.usermodel.XSSFWorkbook
import java.io.File

fun main() {
    embeddedServer(Netty, port = 8080) {
        routing {
            get("/paperweb") {
                call.respondHtml {
                    head {
                        style {
                            // "Paperweb" Aesthetic CSS
                            unsafe { +"""
                                body { 
                                    background-color: #f4f1ea; 
                                    background-image: url('https://www.transparenttextures.com');
                                    font-family: 'Courier New', Courier, monospace;
                                    padding: 50px;
                                    color: #333;
                                }
                                table { border-collapse: collapse; width: 100%; margin-top: 20px; }
                                th, td { border: 1px solid #999; padding: 10px; text-align: left; }
                                th { background: #e0ddd5; }
                            """.trimIndent() }
                        }
                    }
                    body {
                        h1 { +"Paperweb Ledger: com.web.est" }
                        p { +"Data extracted from local XLSX files." }
                        
                        // Example: Basic HTML Table Structure
                        table {
                            tr { th { +"ID" }; th { +"Name" }; th { +"Status" } }
                            tr { td { +"001" }; td { +"Inventory" }; td { +"Active" } }
                        }
                    }
                }
            }
        }
    }.start(wait = true)
}
