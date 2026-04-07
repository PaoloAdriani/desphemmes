package desphemmes.ecommerce

import org.apache.ofbiz.webapp.control.JWTManager
import org.apache.ofbiz.base.crypto.HashCrypt
import org.apache.ofbiz.webapp.control.LoginWorker

import org.apache.ofbiz.webapp.control.JWTManager
import org.apache.ofbiz.base.crypto.HashCrypt
import org.apache.ofbiz.common.login.LoginServices

def resetPasswordWithToken() {
    def token = parameters.token
    def newPassword = parameters.newPassword
    def newPasswordVerify = parameters.newPasswordVerify
    def passwordHint = parameters.passwordHint

    // 1. Decodifica il JWT senza verificarlo per estrarre lo userLoginId
    def decodedJwt = com.auth0.jwt.JWT.decode(token)
    def userLoginId = decodedJwt.getClaim("userLoginId").asString()
    if (!userLoginId) {
        return error("Token non valido: utente non identificabile")
    }

    // 2. Recupera lo UserLogin dal DB
    def userLogin = from("UserLogin").where("userLoginId", userLoginId).queryOne()
    if (!userLogin) {
        return error("Utente non trovato")
    }

    // 3. Ora verifica il JWT con il salt corretto: userLoginId + currentPassword
    String keySalt = userLoginId + userLogin.getString("currentPassword")
    Map<String, Object> claims = JWTManager.validateToken(delegator, token, keySalt)
    if (org.apache.ofbiz.service.ServiceUtil.isError(claims)) {
        return error("Token non valido o scaduto, effettua una nuova richiesta di recupero password")
    }

    // 4. Verifica che le due password coincidano
    if (newPassword != newPasswordVerify) {
        return error("Le password non coincidono")
    }

    // 5. Aggiorna la password direttamente sull'entity
    def crypted = HashCrypt.cryptUTF8(
            org.apache.ofbiz.common.login.LoginServices.getHashType(),
            null,
            newPassword
    )
    def updatedUserLogin = userLogin.clone()
    updatedUserLogin.currentPassword = crypted
    if (passwordHint) {
        updatedUserLogin.passwordHint = passwordHint
    }
    updatedUserLogin.requirePasswordChange = "N"
    updatedUserLogin.store()

    return success()
}