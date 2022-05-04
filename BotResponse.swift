import Foundation
var counter = 0

func getBotResponse(message: String) -> String{
    let tempMessage = message.lowercased()
    
    if tempMessage.contains("1) funktion") {
        counter += 1
        return "Du hast Frage 1 richtig beantwortet"
    }
    else if tempMessage.contains("2) gerade") {
        counter += 1
        return "Du hast Frage 2 richtig beantwortet"
    }
    else if tempMessage.contains("3) man setzt f(x) = 0 und löst nach x auf") {
        counter += 1
        return "Du hast Frage 3 richtig beantwortet"
    }
    else if tempMessage.contains("4) 4x^3-12") {
        counter += 1
        return "Du hast Frage 4 richtig beantwortet"
    }
    else if tempMessage.contains("5) kurvendiskussion") {
        counter += 1
        return "Du hast Frage 5 richtig beantwortet"
    }
    else if tempMessage.contains("6) achsensymmetrie zur y-achse") {
        counter += 1
        return "Du hast Frage 6 richtig beantwortet"
    }
    else if tempMessage.contains("7) streng monoton steigend") {
        counter += 1
        return "Du hast Frage 7 richtig beantwortet"
    }
    else if tempMessage.contains("8) überall nicht-negativ; eine funktion zweiter ordnung") {
        counter += 1
        return "Du hast Frage 8 richtig beantwortet"
    }
    else if tempMessage.contains("9) anstieg; steigung") {
        counter += 1
        return "Du hast Frage 9 richtig beantwortet"
    }
    else if tempMessage.contains("10) lokales minimum") {
        counter += 1
        return "Du hast Frage 10 richtig beantwortet"
    }
    else if tempMessage.contains("ergebnis") {
        let tmp = "So viele Fragen hast du richtig beantwortet: "
        return (tmp + String(counter))
    }
    else if tempMessage.contains("bye") {
        return "Auf Wiedersehen. Hab einen schönen Tag :)"
    }
    else {
        return "Das war leider falsch"
    }
}

